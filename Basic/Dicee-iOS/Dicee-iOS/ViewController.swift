//
//  ViewController.swift
//  Dicee-iOS
//
//  Created by ArunSha on 11/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImage1: UIImageView!
    
    @IBOutlet weak var diceImage2: UIImageView!
    
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        print("Button Got Tapped")
        diceImage1.image = #imageLiteral(resourceName: "DiceFour")
        diceImage2.image = #imageLiteral(resourceName: "DiceFive")
        
        diceImage1.alpha = CGFloat(1)
        diceImage2.alpha = CGFloat(2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        diceImage1.image = #imageLiteral(resourceName: "DiceSix")
        diceImage1.alpha = CGFloat(0.5)
        
        diceImage2.image = #imageLiteral(resourceName: "DiceTwo")
        diceImage2.alpha = CGFloat(0.5)
    }


}

