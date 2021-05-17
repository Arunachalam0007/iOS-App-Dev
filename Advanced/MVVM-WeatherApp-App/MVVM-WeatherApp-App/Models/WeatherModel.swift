//
//  WeatherModel.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 10/05/21.
//

import Foundation

struct WeatherModel: Decodable {
    var weather : [Weather]
    var main: Main
    var name: String
}

struct Main: Decodable {
    var temp: Double
    var humidity: Int
}


struct Weather: Decodable {
    var main: String
    var description: String
}
