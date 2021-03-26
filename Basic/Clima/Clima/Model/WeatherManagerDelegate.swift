//
//  WeatherDelegate.swift
//  Clima
//
//  Created by ArunSha on 26/03/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}
