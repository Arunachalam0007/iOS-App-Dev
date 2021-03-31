//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "🤳🏼 Tie_Up 🤳🏼"
//        var charIndex = 0.0
//        let labelText = "🤳🏼 Tie_Up 🤳🏼"
//
//        for text in labelText {
//            print("Timers: ", 0.5 * charIndex)
//            print(text)
//            print("------")
//            Timer.scheduledTimer(withTimeInterval: 0.5 * charIndex, repeats: false) { (timer) in
//                self.titleLabel.text?.append(text)
//            }
//            charIndex += 1
//
//        }
       
    }
    

}
