//
//  NewsWebService.swift
//  ShaNews-App
//
//  Created by ArunSha on 17/05/21.
//

import Foundation

struct NewsResource<T> {
    let url:URL
    let parse: (Data)->T?
}

struct NewsWebService {
    func loadNews<T>(resource:NewsResource<T>,completion: @escaping (T?) -> () ) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let newsDataBytes = data {
                DispatchQueue.main.async {
                    completion(resource.parse(newsDataBytes))
                }
            } else if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
        }.resume()
    }
}
