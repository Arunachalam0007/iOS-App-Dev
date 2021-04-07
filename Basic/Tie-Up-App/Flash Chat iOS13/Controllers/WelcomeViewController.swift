//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var charIndex = 0.0
        
        let labelText = "🤳🏼Tie_Up🤳🏼"
        titleLabel.text = ""
        for text in labelText {
            Timer.scheduledTimer(withTimeInterval: 0.5 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(text)
            }
            charIndex += 1
        }
       
    }
    

}
