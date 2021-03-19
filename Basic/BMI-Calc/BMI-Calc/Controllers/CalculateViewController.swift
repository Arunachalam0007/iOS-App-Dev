//
//  ViewController.swift
//  BMI-Calc
//
//  Created by ArunSha on 18/03/21.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatedBMIValue : String = ""
    @IBOutlet weak var heightValueLabel: UILabel!
    
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        // print("%.02f", your_float_var)
        let height = String(format: "%.2f", sender.value)
        heightValueLabel.text = "\(height)cm"
    }
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightValueLabel.text =   "\(weight)kg"
    }
    @IBAction func calcuateResultBMI(_ sender: UIButton) {
        let bmiResult = weightSlider.value / pow(heightSlider.value, 2)
        print(bmiResult)
        
        calculatedBMIValue = String(format: "%.1f", bmiResult)
        
        //        let mySecondViewController = SecondViewController()
        //        mySecondViewController.bmiValue = String(format: "%.1f", bmiResult)
        //        self.present(mySecondViewController, animated: true, completion: nil)
        
        // which is used to naviate to another page
        
        //performSegue(withIdentifier: "goToSecond", sender: self)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    // this method is used to initialize the class variable and pass value to the argument
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // finding the identifier
        if segue.identifier == "goToResult"  {
            // get the result view controller by downcasting (as!) viewcontroller to viewcontroller
            let resultVC = segue.destination as! ResultViewController
            resultVC.bmiResult = calculatedBMIValue
        } else if segue.identifier == "goToSecond" {
            let resultVC = segue.destination as! SecondViewController
            resultVC.bmiValue = calculatedBMIValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

