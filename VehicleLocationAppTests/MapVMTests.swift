//
//  MapVMTests.swift
//  VehicleLocationAppTests
//
//  Created by Stuti on 02/07/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import XCTest
@testable import VehicleLocationApp

class MapVMTests: XCTestCase {
    var mapVM: MapVM!
    
    override func setUp() {
        let apiManager = MockApiManager.shared
        mapVM = MapVM(with: apiManager)
        
        let json: [String: Any] = ["id": 1,
                                   "name": "000011",
                                   "description": "Electric Scooter",
                                   "latitude": 52.529077,
                                   "longitude": 13.416351,
                                   "batteryLevel": 98,
                                   "timestamp": "2019-03-10T09:31:56Z",
                                   "price": 15,
                                   "priceTime": 60,
                                   "currency": "€"]
        
        do {
            let data = try JSONSerialization.data(withJSONObject: [json], options: .prettyPrinted)
            apiManager.setCompletion(data: data, error: nil)
        } catch {
            apiManager.setCompletion(data: nil, error: error)
        }
    }
    
    func testInit() {
        XCTAssertNotNil(mapVM)
    }
    
    func testVehicleCount() {
        XCTAssertEqual(mapVM.vehicleCount(), 1)
    }
    
    func testVehicleData() {
        let vehicles = mapVM.vehicleData()
        XCTAssertEqual(vehicles[0].name, "000011")
    }
    
    func testGetVehicle() {
        let vehicle = mapVM.getVehicle(at: 0)
        XCTAssertEqual(vehicle.id, 1)
        XCTAssertEqual(vehicle.name, "000011")
        XCTAssertEqual(vehicle.descrip, "Electric Scooter")
        XCTAssertEqual(vehicle.latitude, 52.529077)
        XCTAssertEqual(vehicle.longitude, 13.416351)
        XCTAssertEqual(vehicle.batteryLevel, 98)
        XCTAssertEqual(vehicle.price, 15)
        XCTAssertEqual(vehicle.currency, "€")
    }
    
    func testFailing() {
        let apiManager = MockApiManager.shared
        let mapVM = MapVM(with: apiManager)
        
        apiManager.setCompletion(data: nil, error: nil)
        
        XCTAssertNotNil(mapVM)
        XCTAssertEqual(mapVM.vehicleCount(), 0)
    }
}
