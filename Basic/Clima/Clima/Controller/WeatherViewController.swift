//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchCityTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchCityTextField.delegate = self
        weatherManager.delegate = self
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
}

// MARK: - UITextFieldDelegate

extension WeatherViewController : UITextFieldDelegate {
    
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
    
}

// MARK: - WeatherManagerDelegate


extension WeatherViewController : WeatherManagerDelegate {
    
    func didUpdateWeather(weather: WeatherModel) {
        
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.tempString
            self.cityLabel.text = weather.cityName
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
        
    }
    func didFailedWithError(error: Error) {
        print("Sha Error's ",error)
    }
}


// MARK: - GetCurrentLocation


extension WeatherViewController: CLLocationManagerDelegate {
    
    @IBAction func currentNavigatorPressed(_ sender: UIButton) {
        print("currentNavigatorPressed")
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("GOt Location")
        print(locations)
        locationManager.stopUpdatingLocation()
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            print(lat, lon)
            weatherManager.fetchWeather(latitude: lat, Longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
