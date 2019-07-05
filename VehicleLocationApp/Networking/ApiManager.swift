//
//  ApiManager.swift
//  VehicleLocationApp
//
//  Created by Stuti on 29/06/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation

protocol Networking {
    func fetch(with url: URL, completionHandler: @escaping (Data?, Error?) -> ())
}

final class ApiManager: Networking {
    
    static let shared = ApiManager()
    
    private let session = URLSession.shared
    
    func fetch(with url: URL, completionHandler: @escaping (Data?, Error?) -> ()) {
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(nil, error)
            }
            
            if let data = data {
                completionHandler(data, nil)
            }
        }
        task.resume()
    }
}
