//
//  ServiceLayer.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/12/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import Foundation

class ServiceLayer {

    class func request(router: Router, completion: @escaping (Result<FlightJSON, Error>) -> ()) {
     
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
      
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let err = error {
                completion(.failure(err))
                print(err.localizedDescription)
                return
            }
            guard response != nil, let data = data else {
                return
            }
         
            print("SERVICE LAYER: RESPONSE\(response!), DATA: \(data)")
            let responseObject = try! JSONDecoder().decode(FlightJSON.self, from: data)
            DispatchQueue.main.async {
                completion(.success(responseObject))
            }
        }
        dataTask.resume()
    }
}
