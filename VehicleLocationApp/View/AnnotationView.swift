//
//  AnnotationView.swift
//  VehicleLocationApp
//
//  Created by Stuti on 29/06/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

class AnnotationView: UIView {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var batteryLevel: UILabel!
    
    func set(_ vehicle: Vehicle) {
        name.text = "\(Constants.Name.value)\(vehicle.name ?? "")"
        desc.text = "\(Constants.Description.value)\(vehicle.descrip ?? "")"
        price.text = "\(Constants.Price.value)\(vehicle.price ?? 0) \(vehicle.currency ?? "")"
        batteryLevel.text = "\(Constants.Battery.value)\(vehicle.batteryLevel ?? 0)\(Constants.Percent.value)"
    }
}
