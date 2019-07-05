//
//  Extensions.swift
//  VehicleLocationApp
//
//  Created by Stuti on 30/06/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import MapKit

extension MKMapView {
    
    func fitMapViewToAnnotaionList() {
        let mapEdgePadding = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        var zoomRect: MKMapRect = MKMapRect.null
        
        for index in 0..<self.annotations.count {
            let annotation = self.annotations[index]
            let aPoint: MKMapPoint = MKMapPoint(annotation.coordinate)
            let rect: MKMapRect = MKMapRect(x: aPoint.x, y: aPoint.y, width: 0.1, height: 0.1)
            
            if zoomRect.isNull {
                zoomRect = rect
            } else {
                zoomRect = zoomRect.union(rect)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.setVisibleMapRect(zoomRect, edgePadding: mapEdgePadding, animated: true)
        }
    }
}

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}
