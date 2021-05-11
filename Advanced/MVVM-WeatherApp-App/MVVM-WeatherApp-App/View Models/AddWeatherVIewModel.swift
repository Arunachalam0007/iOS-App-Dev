//
//  AddWeatherVIewModel.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 10/05/21.
//

import Foundation

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherViewModel {
    func addWeather(for cityName: String, completion: @escaping (WeatherViewModel?)->Void)  {
        
        if let weatherURL = K.Urls.getWeatherMapURL(cityName: cityName) {
            let weatherResource = WeatherResource<WeatherModel>(url: weatherURL) { data in
                return try? JSONDecoder().decode(WeatherModel.self, from: data)
            }
            
            WeatherWebService().load(resource: weatherResource) { result in
                if let weatherResourceResult = result {
                    let weatherVM = WeatherViewModel(weatherModel: weatherResourceResult)
                    completion(weatherVM)
                }
            }
        } else {
            completion(nil)
        }
    }
}

