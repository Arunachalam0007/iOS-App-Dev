//
//  WeatherListViewModel.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 10/05/21.
//

import Foundation

class WeatherListViewModel  {
    private(set) var listWeatherModels = [WeatherViewModel]()
    
    func appendWeatherViewModel(vm: WeatherViewModel) {
        listWeatherModels.append(vm)
    }
    
    func numberOfRows() -> Int {
        return listWeatherModels.count
    }
    
    func weatherModelIndexAt(index: Int) -> WeatherViewModel {
        return listWeatherModels[index]
    }
    
    func setUnitCityTemp(unitTemp: Unit) {
        
        switch unitTemp {
        case .celsius:
            Celsius()
        case .fahrenheit:
            Fahrenheit()
        }
    }
    
    
    func Celsius() {
        listWeatherModels = listWeatherModels.map({ weatherVM in
            if let cityTemp = weatherVM.cityTemp {
                weatherVM.cityTemp = (cityTemp - 32) * 5/9
            }
            return weatherVM
        })
    }
    
    func Fahrenheit() {
        listWeatherModels = listWeatherModels.map({ weatherVM in
            if let cityTemp = weatherVM.cityTemp {
                weatherVM.cityTemp = (cityTemp * 9/5) + 32
            }
            return weatherVM
        })
    }
    
}

class WeatherViewModel {
    let weatherModel : WeatherModel?
    var cityTemp: Double?
    init(weatherModel: WeatherModel){
        self.weatherModel = weatherModel
        self.cityTemp = weatherModel.main.temp
    }
    
    var cityName: String? {
        return weatherModel?.name
    }
    
}
