//
//  NewsWebService.swift
//  MVVM-SHA-News-APP
//
//  Created by ArunSha on 04/05/21.
//

import Foundation

class NewsWebService {
    
    func getNewsData(url: URL,
                     completionHandler: @escaping ([Article])->()) {
        print("GetNews Data Called")
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                  let NewsData =  try JSONDecoder().decode(NewsData.self, from: data)
                    completionHandler(NewsData.articles)
                   // completionHandler()
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }.resume()
        print("GetNews Data Ended")
    }
    
}
