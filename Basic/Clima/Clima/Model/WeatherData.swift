//
//  WeatherData.swift
//  Clima
//
//  Created by ArunSha on 24/03/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    var name:String
    var weather: [Weather]
    var main : main
}

struct Weather: Codable {
    var id:Int
    var main:String
}

struct main: Codable {
    var temp: Double
}
