//
//  ViewController.swift
//  Quizzler
//
//  Created by ArunSha on 17/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    var questionNumber = 0
    
    var quiz = [
    Question(q: "IND Won the World cup at 2011", a: true),
        Question(q: "IND Won the World cup at 2020", a: false),
        Question(q: "AUS Won the World cup at 2020", a: true),
        Question(q: "Current Indian Captain is Kholi", a: true),
        Question(q: "Kohli Let the IPL tropy Many Times", a: true),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func ansBtnPressed(_ sender: UIButton) {
        
        let userAns = Bool(truncating: sender.tag as NSNumber)
        let actualAns = quiz[questionNumber].answer
        
        print(userAns)
        print(actualAns)
        
        if userAns == actualAns {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        
        if questionNumber < quiz.count-1 {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI()  {
        questionLabel.text = quiz[questionNumber].question
        trueBtn.backgroundColor = nil
        falseBtn.backgroundColor =  UIColor.clear
        progressView.progress = Float (questionNumber)/Float(quiz.count)
    }
    
}

