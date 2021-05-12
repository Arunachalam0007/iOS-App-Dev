//
//  WeatherListTableViewController.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 10/05/21.
//

import UIKit

class WeatherListTableViewController: UITableViewController {
    
    var weatherListVM = WeatherListViewModel()
    
    var weatherUnit: Unit?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // Registering XIB cell to tableview
        tableView.register(UINib(nibName: K.Weather.weatherCellNibName, bundle: nil), forCellReuseIdentifier: K.Weather.weatherCellIdentifier)
        
        loadWeatherUnit()
    }
    
    func loadWeatherUnit () {
        if let wUnit = UserDefaults.standard.value(forKey: K.UnitUserDefaults.unitUserDefault) as? String {
            weatherUnit = Unit(rawValue: wUnit)
        }
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherListVM.listWeatherModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Weather.weatherCellIdentifier, for: indexPath) as! WeatherCell
        
        let weatherVM = weatherListVM.weatherModelIndexAt(index: indexPath.row)
        
        cell.setCellValue(vm: weatherVM)
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherNav" {
            prepareSegueForAddWeatherCityVC(for: segue)
        } else if segue.identifier == "SettingsNav" {
            self.prepareSegueForSettingsVC(for: segue)
        }
    }
    
    func prepareSegueForAddWeatherCityVC(for segue: UIStoryboardSegue){
        guard let navController = segue.destination as? UINavigationController else {
            fatalError("UINavigationContoller is Not Found")
        }
        guard let addWeatherVC = navController.viewControllers.first as? AddWeatherViewController else {
            fatalError("UIViewContoller is Not Found")
        }
        addWeatherVC.addWeatherDelegate = self
    }
    
    func prepareSegueForSettingsVC (for segue: UIStoryboardSegue) {
        guard let navController = segue.destination as? UINavigationController else { fatalError("UINavigationContoller is Not Found")
        }
        guard let settingsVC = navController.viewControllers.first as? SettingsTableViewController else {
            fatalError("UINavigationContoller is Not Found")
        }
        settingsVC.settingsDelegate = self
    }
    
}

extension WeatherListTableViewController : AddWeatherDelegate {
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        print("AddWeather Did Save VM: ",vm)
        weatherListVM.appendWeatherViewModel(vm: vm)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension WeatherListTableViewController : settingsUnitDelegate {
    func setWeatherUnit(vm: SettingsViewModel) {
        if weatherUnit != vm.selectedUnit {
            weatherUnit = vm.selectedUnit
            weatherListVM.setUnitCityTemp(unitTemp: vm.selectedUnit)
            self.tableView.reloadData()
        }
    }
}
