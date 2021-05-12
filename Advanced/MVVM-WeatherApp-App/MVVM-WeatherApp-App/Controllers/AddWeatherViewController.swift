//
//  AddWeatherViewController.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 10/05/21.
//

import Foundation
import UIKit



class AddWeatherViewController: UIViewController {
    
    @IBOutlet weak var cityNameSearchTextField: UITextField!
    
    @IBOutlet weak var countryNameSearchTextField: UITextField!
    
    @IBOutlet weak var zipCodeSearchTextField: UITextField!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    var addWeatherVM = AddWeatherViewModel()
    
    var addWeatherDelegate : AddWeatherDelegate?

    @IBAction func closeBtnPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func searchCityWeather(_ sender: UIButton) {
        if let cityName = cityNameSearchTextField.text {
            addWeatherVM.addWeather(for: cityName) { weatherVM in
                if let weatherVM = weatherVM {
                    self.addWeatherDelegate?.addWeatherDidSave(vm: weatherVM)
                    self.dismiss(animated: true) {
                        print("DisMissed")
                    }
                } else {
                    print("URL is NOT Correct")
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
