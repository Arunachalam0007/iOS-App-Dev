//
//  ViewController.swift
//  Food Timer
//
//  Created by ArunSha on 16/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var foodLabel: UILabel!
    
    @IBOutlet weak var foodProgressBar: UIProgressView!
    
    var foodTime = ["Soft":3,"Medium":10,"Hard":700]
    
    var timePassed:Float = 0.0
    var totalTime:Float = 0.0

    @IBAction func foodSelected(_ sender: UIButton) {
        
        let title = sender.currentTitle!
        foodProgressBar.progress = 0
        print(foodTime[title] ?? 0)
        totalTime =  Float(foodTime[title] ?? 0)
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (Timer) in
            if self.timePassed < self.totalTime {
                let secondsPassed =  self.timePassed / self.totalTime
                self.foodProgressBar.progress = secondsPassed
                self.timePassed += 1
                print("Time Passing     ",secondsPassed)
            } else {
                Timer.invalidate()
                self.foodProgressBar.progress = 1
                self.foodLabel.text = "Your \(title) EGG Got Ready !!!"
            }
            print(self.timePassed," Seconds")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

