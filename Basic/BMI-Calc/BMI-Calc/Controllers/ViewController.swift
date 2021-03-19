//
//  ViewController.swift
//  BMI-Calc
//
//  Created by ArunSha on 18/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightValueLabel: UILabel!
    
    @IBOutlet weak var weightValueLabel: UILabel!
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        // print("%.02f", your_float_var)
        let height = String(format: "%.2f", sender.value)
        heightValueLabel.text = "\(height)cm"
    }
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightValueLabel.text =   "\(weight)kg"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

