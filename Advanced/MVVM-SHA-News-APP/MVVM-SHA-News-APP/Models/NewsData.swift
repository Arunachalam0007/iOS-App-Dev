//
//  NewsData.swift
//  MVVM-SHA-News-APP
//
//  Created by ArunSha on 04/05/21.
//

import Foundation

struct NewsData : Decodable {
    var articles : [Article]
}

struct Article : Decodable {
    var urlToImage: String
    var title: String
    var description: String
}
