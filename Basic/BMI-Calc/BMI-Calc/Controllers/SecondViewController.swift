//
//  SecondViewController.swift
//  BMI-Calc
//
//  Created by ArunSha on 19/03/21.
//

import UIKit

class SecondViewController: UIViewController {

    var bmiValue: String!
    let label = UILabel()
    let btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("It's calling initially")
        
        self.view.backgroundColor = .red
        
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 20)
        label.text = bmiValue
        self.view.addSubview(label)
        
        btn.frame = CGRect(x: 100, y: 500, width: 100, height: 20)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(onSelct), for: .touchUpInside)
        self.view.addSubview(btn)
        
    }
    @objc func onSelct()  {
        dismiss(animated: true) {
            print("Dismissed")
        }
    }
}
