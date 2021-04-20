//
//  ResultViewController.swift
//  BMI-Calc
//
//  Created by ArunSha on 19/03/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiResult:String?
    var bmiAdviceValue:String?
    var bmiColor:UIColor?

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!

    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true) {
            print("Dismissing")
        }
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiResult
        adviceLabel.text = bmiAdviceValue
        view.backgroundColor = bmiColor
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
