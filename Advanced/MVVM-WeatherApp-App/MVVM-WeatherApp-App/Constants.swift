//
//  Constants.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 10/05/21.
//

import Foundation
struct K {
    static let cityName:String = "Chengalpattu"
    static let apiID:String = "3cc913675a5741818d6feaf11955e809"
    static let weatherMapURL = "http://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiID)&units=metric"
    
    struct Weather {
        static let weatherCellIdentifier: String = "WeatherInfoCell"
        static let weatherCellNibName: String = "WeatherCell"
    }
}
