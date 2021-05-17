//
//  WeatherDataSource.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 13/05/21.
//

import Foundation
import UIKit

class WeatherDataSource: NSObject,UITableViewDataSource {
    
    let weatherCellIdentifier: String
    
    let weatherVM : WeatherListViewModel
    
    
    init(cellIdentifier: String, weatherVM: WeatherListViewModel) {
        self.weatherCellIdentifier = cellIdentifier
        self.weatherVM = weatherVM
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherVM.listWeatherModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: weatherCellIdentifier, for: indexPath) as! WeatherCell
        
        let currentWeatherVM = weatherVM.weatherModelIndexAt(index: indexPath.row)
        
        cell.setCellValue(vm: currentWeatherVM)
        
        return cell
    }
}
