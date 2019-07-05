//
//  MapVM.swift
//  VehicleLocationApp
//
//  Created by Stuti on 29/06/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation
import MapKit

protocol UIDelegate: class {
    func updateUI()
}

class MapVM {
    
    //MARK:- Properties
    private let apiManager: Networking
    private var vehicleArray = [Vehicle]()
    weak var uidelegate: UIDelegate?
    
    //MARK:- Methods
    init(with networkingManager: Networking) {
        apiManager = networkingManager
        fetchAllVehicles()
    }
    
    func vehicleCount() -> Int {
        return vehicleArray.count
    }
    
    func vehicleData() -> [Vehicle] {
        return vehicleArray
    }
    
    func getVehicle(at index: Int) -> Vehicle {
        return vehicleArray[index]
    }
    
    //MARK: Fetch API
    private func fetchAllVehicles() {
        guard let url = URL(string: URLConstants.Vehicles.all.url) else { return }
        apiManager.fetch(with: url) { (data, error) in
            do {
                guard let data = data else { return }
                
                self.vehicleArray.removeAll()
                let result = try JSONDecoder().decode([Vehicle].self, from: data)
                for vehicle in result {
                    vehicle.coordinate = CLLocationCoordinate2DMake(vehicle.latitude ?? 0, vehicle.longitude ?? 0)
                    self.vehicleArray.append(vehicle)
                }
                
                self.uidelegate?.updateUI()
            } catch {
            }
        }
    }
}
