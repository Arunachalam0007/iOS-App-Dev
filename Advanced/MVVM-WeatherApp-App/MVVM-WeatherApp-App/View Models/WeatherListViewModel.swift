//
//  WeatherListViewModel.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 10/05/21.
//

import Foundation

class WeatherListViewModel  {
    var listWeatherModels = [WeatherViewModel]()
    
    func appendWeatherViewModel(vm: WeatherViewModel) {
        listWeatherModels.append(vm)
    }
    
    func numberOfRows() -> Int {
        return listWeatherModels.count
    }
    
    func weatherModelIndexAt(index: Int) -> WeatherViewModel {
        return listWeatherModels[index]
    }
}

class WeatherViewModel {
    let weatherModel : WeatherModel?
    
    init(weatherModel: WeatherModel){
        self.weatherModel = weatherModel
    }
    
    var cityName: String? {
        return weatherModel?.name
    }
    
    var cityTemp : Double? {
        return weatherModel?.main.temp
    }
    
}
