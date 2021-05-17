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

struct Resource<U: Codable> {
    let url : URL
}

struct OrderWebService {
    func getOrders<T>(resource: Resource<T>, completion: @escaping (Result<[T], NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            
            do{
                let order = try JSONDecoder().decode([T].self,from: data)
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

//
//func setOrders<T>(resource: Resource<T>, completion: @escaping (Result<[T], NetworkError>)-> Void) {
//    var urlRequest = URLRequest(url: resource.url)
//    let data = try? JSONEncoder().encode(resource.orderData)
//    
//    urlRequest.httpMethod = "POST"
//    urlRequest.httpBody = data
//    urlRequest.addValue( "application/json", forHTTPHeaderField: "Content-Type")
//    
//    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//        
//        guard let data = data , error == nil else {
//            completion(.failure(.domainError))
//            return
//        }
//        
//        let result = try? JSONDecoder().decode(T.self, from: data)
//        print("Post Result ", result)
//        
//    }.resume()
//    
//}
//}
