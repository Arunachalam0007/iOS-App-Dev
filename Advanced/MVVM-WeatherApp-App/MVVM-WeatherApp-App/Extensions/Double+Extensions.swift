//
//  Double+Extensions.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 11/05/21.
//

import Foundation
extension Double {
    func formatAsDegree() -> String {
        return String(format: "%.0f°", self)
    }
}
