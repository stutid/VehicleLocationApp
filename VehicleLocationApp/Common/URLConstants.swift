//
//  URLConstants.swift
//  VehicleLocationApp
//
//  Created by Stuti on 29/06/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation

enum URLConstants {
    
    private static let BASE_URL = "https://my-json-server.typicode.com/FlashScooters/Challenge/"
    
    enum Vehicles {
        case all
        
        var url: String {
            return "\(BASE_URL)vehicles"
        }
    }
}
