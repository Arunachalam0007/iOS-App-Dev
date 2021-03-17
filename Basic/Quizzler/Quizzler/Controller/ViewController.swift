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
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func ansBtnPressed(_ sender: UIButton) {
        
        
        let userAns = Bool(truncating: sender.tag as NSNumber)
        let correctAns = quizBrain.getQuesAns(userAns: userAns)
        
        
        if correctAns {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI()  {
        questionLabel.text = quizBrain.getQuestion()
        trueBtn.backgroundColor = nil
        falseBtn.backgroundColor =  UIColor.clear
        progressView.progress = quizBrain.getProgress()
        scoreLabel.text = quizBrain.getScore()
    }
    
}

