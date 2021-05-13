//
//  SettingsViewModel.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 11/05/21.
//

import Foundation

protocol settingsUnitDelegate {
    func setWeatherUnit(vm: SettingsViewModel)
}

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String  {
        switch (self) {
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        }
    }
}

class SettingsViewModel{
    let units = Unit.allCases
    
    func settingsValue(index: Int) -> String {
       return units[index].displayName
    }
    var selectedUnit : Unit {
        set {
            UserDefaults.standard.setValue(newValue.rawValue, forKey: "SettingsSelectedUnit")
        }
        get {
            let settingsUnit = UserDefaults.standard.value(forKey: "SettingsSelectedUnit")
            return Unit(rawValue: settingsUnit as? String ?? "metric")!
        }
    }
}
