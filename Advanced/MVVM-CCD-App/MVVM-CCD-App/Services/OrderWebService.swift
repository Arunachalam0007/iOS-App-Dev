//
//  OrderWebService.swift
//  MVVM-CCD-App
//
//  Created by ArunSha on 04/05/21.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

struct OrderWebService {
    func getOrders(url:URL, completion: @escaping (Result<Any, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            
            do{
                let order = try JSONDecoder().decode([Order].self,from: data)
                DispatchQueue.main.async {
                    completion(.success(order))
                }
            } catch {
                completion(.failure(.decodingError))
                fatalError(error.localizedDescription)
            }
        }.resume()
    }
}
