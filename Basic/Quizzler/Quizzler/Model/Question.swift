//
//  Question.swift
//  Quizzler
//
//  Created by ArunSha on 17/03/21.
//

import Foundation

struct Question {
    var question:String
    var answer:Bool
    
    init(q:String, a:Bool) {
        self.question = q
        self.answer = a
    }
}
