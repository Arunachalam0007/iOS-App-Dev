//
//  Constants.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 10/05/21.
//

import Foundation
struct K {
    static let apiID:String = "3cc913675a5741818d6feaf11955e809"
    
    struct Urls {
       static func getWeatherMapURL(cityName:String)-> URL? {
        let userDefaultUnit = UserDefaults.standard.value(forKey: UnitUserDefaults.unitUserDefault) as? String
            let weatherMapURL = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiID)&units=\(userDefaultUnit ?? "imperial")"
        print(weatherMapURL)
            return URL(string: weatherMapURL)
        }
    }
    
    struct Weather {
        static let weatherCellIdentifier: String = "WeatherInfoCell"
        static let weatherCellNibName: String = "WeatherCell"
    }
    
    struct Settings {
        static let settingsCellIdentifier: String = "SettingsUnitCell"
    }
    
    struct UnitUserDefaults {
        static let unitUserDefault = "SettingsSelectedUnit"
    }
}
