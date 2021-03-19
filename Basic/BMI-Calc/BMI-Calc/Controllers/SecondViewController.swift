//
//  SecondViewController.swift
//  BMI-Calc
//
//  Created by ArunSha on 19/03/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    let label = UILabel()
    var bmiValue = "nill"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("It's calling initially")
        
        self.view.backgroundColor = .red
        
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 20)
        label.text = bmiValue
        self.view.addSubview(label)
        
        
    }
}
