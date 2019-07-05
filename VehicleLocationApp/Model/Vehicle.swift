//
//  Vehicle.swift
//  VehicleLocationApp
//
//  Created by Stuti on 29/06/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation
import MapKit

class Vehicle: MKPointAnnotation, Decodable {
    var id: Int?
    var name: String?
    var descrip: String?
    var latitude: Double?
    var longitude: Double?
    var batteryLevel: Int?
    var price: Int?
    var currency: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case descrip = "description"
        case latitude
        case longitude
        case batteryLevel
        case price
        case currency
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        descrip = try values.decodeIfPresent(String.self, forKey: .descrip)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
        batteryLevel = try values.decodeIfPresent(Int.self, forKey: .batteryLevel)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
    }
}
