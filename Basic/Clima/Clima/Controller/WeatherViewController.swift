//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate,WeatherManagerDelegate {

 
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchCityTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    @IBAction func searchCity(_ sender: UIButton) {
        print(searchCityTextField.text!)
        searchCityTextField.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       // textField.endEditing(true)
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type Some Thing"
            return false
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Did end editing")
        if let cityName = textField.text {
            weatherManager.fetchWeather(cityName: cityName)
        }
    }
    
//    func didUpdateWeather(weather: WeatherModel) {
//        print(weather.temp)
//      //  temperatureLabel.text = weather.tempString
//    }
    func didUpdateWeather(weather: WeatherModel) {
          print(weather.temp)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchCityTextField.delegate = self
    }

}

