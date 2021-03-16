//
//  ViewController.swift
//  Food Timer
//
//  Created by ArunSha on 16/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var foodLabel: UILabel!
    
    var foodTime = ["Soft":300,"Medium":500,"Hard":700]
    
    var seconds = 60

    @IBAction func foodSelected(_ sender: UIButton) {
        let title = sender.currentTitle!
        
        seconds =  foodTime[title]!
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            if self.seconds > 0 {
                self.seconds -= 1
            } else {
                Timer.invalidate()
                self.foodLabel.text = "Your \(title) EGG Got Ready !!!"
            }
            print(self.seconds," Seconds")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

