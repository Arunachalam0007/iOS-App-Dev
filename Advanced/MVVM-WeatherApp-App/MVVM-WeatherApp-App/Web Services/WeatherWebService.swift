//
//  WeatherWebService.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 10/05/21.
//

import Foundation

struct WeatherResource<T> {
    let url: URL
    let parse: (Data) -> T?
}

class WeatherWebService {
    
    func load<T>(resource: WeatherResource<T>, completion: @escaping (T?) ->()) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
    
}
