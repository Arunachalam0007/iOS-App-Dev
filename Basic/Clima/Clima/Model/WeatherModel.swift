//
//  WeatherModel.swift
//  Clima
//
//  Created by ArunSha on 26/03/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    // Stored Properties
    
    var conditionId: Int
    var cityName: String
    var temp: Int
    
    
    // Computed Properties
    
    var tempString: String {
        print("Temp is :", temp)
        return String(temp)
    }
    
    var conditionName : String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.show"
        case 200...232:
            return "cloud.bolt"
        case 700...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
}
