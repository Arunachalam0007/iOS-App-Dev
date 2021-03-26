//
//  WeatherData.swift
//  Clima
//
//  Created by ArunSha on 24/03/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    var name:String
    var weather: [Weather]
    var main : main
}

struct Weather: Decodable {
    var id:Int
    var main:String
}

struct main: Decodable {
    var temp: Int
}
