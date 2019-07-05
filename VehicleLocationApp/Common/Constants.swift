//
//  Constants.swift
//  VehicleLocationApp
//
//  Created by Stuti on 02/07/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation

enum Constants: String {
    case Name = "Name: "
    case Description = "Description: "
    case Price = "Price: "
    case Battery = "Battery Level: "
    case Percent = "%"
    
    var value: String {
        return self.rawValue
    }
}
