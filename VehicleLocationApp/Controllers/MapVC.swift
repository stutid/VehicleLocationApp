//
//  ViewController.swift
//  VehicleLocationApp
//
//  Created by Stuti on 29/06/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    
    //MARK:- Outlets and Properties
    @IBOutlet weak var mapView: MKMapView!
    private var mapVM = MapVM(with: ApiManager.shared)
    
    //MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        mapVM.uidelegate = self
    }
}

//MARK:- MapView Delegates Extension
extension MapVC: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        }
        
        if let vehicleAnnotation = annotation as? Vehicle {
            guard let customView = Bundle.main.loadNibNamed(AnnotationView.className, owner: self, options: nil)?.first as? AnnotationView else { return nil }
            annotationView?.detailCalloutAccessoryView = customView
            annotationView?.image = UIImage(named: "escooter")
            customView.set(vehicleAnnotation)
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        mapView.fitMapViewToAnnotaionList()
    }
}

//MARK:- Custom UIDelegate Extension
extension MapVC: UIDelegate {
    func updateUI() {
        DispatchQueue.main.async {
            self.mapView.addAnnotations(self.mapVM.vehicleData())
            
            if self.mapVM.vehicleCount() > 0 {
                let data = self.mapVM.getVehicle(at: 0)
                let region = MKCoordinateRegion(center: data.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
                self.mapView.setRegion(region, animated: true)
            }
        }
    }
}
