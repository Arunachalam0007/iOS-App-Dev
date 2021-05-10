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
    @IBOutlet weak var saveBtn: UIButton!
    

    @IBAction func closeBtnPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true) {
            print("Dismissed")
        }
    }
    
    @IBAction func searchCityWeather(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Ho")
    }
    
}
