//
//  NewsData.swift
//  ShaNews-App
//
//  Created by ArunSha on 17/05/21.
//

import Foundation

struct NewsModel: Decodable {
    var articles: [Article]
}

struct Article: Decodable, Identifiable {
    var id: String? {
        return title
    }
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    
 
}
