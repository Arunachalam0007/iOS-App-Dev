//
//  AddWeatherViewController.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 10/05/21.
//

import Foundation
import UIKit



class AddWeatherViewController: UIViewController {
    
    @IBOutlet weak var cityNameSearchTextField: BindingTextField! {
        didSet{
            // Here we can directly append the view Value to View Model
            cityNameSearchTextField.customTextFieldBind { self.addInfoWeatherCityVM.cityName = $0 }
        }
    }
    
    @IBOutlet weak var countryNameSearchTextField: BindingTextField! {
        didSet{
            countryNameSearchTextField.customTextFieldBind { textValue in
                // Here we can directly append the view Value to View Model
                print("Country Name: ", textValue)
                self.addInfoWeatherCityVM.countryName = textValue
            }
        }
    }
    
    @IBOutlet weak var zipCodeSearchTextField: BindingTextField! {
        didSet{
            // Here we can directly append the view Value to View Model
            zipCodeSearchTextField.customTextFieldBind { self.addInfoWeatherCityVM.zipCode = $0 }
        }
    }
    
    @IBOutlet weak var saveBtn: UIButton!
    
    var addInfoWeatherCityVM = AddInfoWeatherCityViewModel()
    
    var addWeatherVM = AddWeatherViewModel()
    
    var addWeatherDelegate : AddWeatherDelegate?

    @IBAction func closeBtnPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func searchCityWeather(_ sender: UIButton) {
        print("Get binded VM Values from (View to VM) : CityName:",self.addInfoWeatherCityVM.cityName," Country: ", self.addInfoWeatherCityVM.countryName," ZipCode: ",self.addInfoWeatherCityVM.zipCode )
        if let cityName = cityNameSearchTextField.text {
            addWeatherVM.addWeather(for: cityName) { weatherVM in
                if let weatherVM = weatherVM {
                    self.addWeatherDelegate?.addWeatherDidSave(vm: weatherVM)
                    self.dismiss(animated: true)
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
