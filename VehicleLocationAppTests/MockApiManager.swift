//
//  MockApiManager.swift
//  VehicleLocationAppTests
//
//  Created by Stuti on 03/07/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation
@testable import VehicleLocationApp

final class MockApiManager: Networking {
    
    static let shared = MockApiManager()
    
    var completion: ((Data?, Error?) -> Void)?
    
    func fetch(with url: URL, completionHandler: @escaping (Data?, Error?) -> ()) {
        completion = completionHandler
    }
    
    func setCompletion(data: Data?, error: Error?) {
        completion?(data, error)
    }
}
