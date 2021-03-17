//
//  QuizBrain.swift
//  Quizzler
//
//  Created by ArunSha on 17/03/21.
//

import Foundation

struct QuizBrain {
    
    var quiz = [
    Question(q: "IND Won the World cup at 2011", a: true),
        Question(q: "IND Won the World cup at 2020", a: false),
        Question(q: "AUS Won the World cup at 2020", a: false),
        Question(q: "Current Indian Captain is Kholi", a: true),
        Question(q: "Kohli Let the IPL tropy Many Times", a: true),
    ]
    
    var score = 0
    
    var questionNumber = 0
    
    mutating func nextQuestion()  {
         if questionNumber < quiz.count-1 {
             questionNumber += 1 // changing vaiable value so added mutating
         } else {
             questionNumber = 0
             score = 0  // changing vaiable value so added mutating
         }
     }
    
   mutating func getQuesAns(userAns :  Bool) -> Bool {
        if userAns == quiz[questionNumber].answer {
            score += 1 // changing vaiable value so added mutating
            return true
        } else {
            return false
        }
    }
    
    func getScore() -> String {
        return "Your Score: \(score)"
    }
    
    func getQuestion() -> String {
        return quiz[questionNumber].question
    }
    
    func getProgress() -> Float {
        return (Float (questionNumber)/Float(quiz.count))
    }
    
}
