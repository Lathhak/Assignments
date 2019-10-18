//
//  QuestionPaper.swift
//  QuizFromScratch
//
//  Created by Sharan on 10/17/19.
//  Copyright © 2019 Sharan. All rights reserved.
//

import Foundation

struct  Question{
    let question: String
    let answer: [String]
    let cAnswer: String
    
    init(q: String, a: [String], correctAnswer: String ) {
        question = q
        answer = a
        cAnswer = correctAnswer
    }
}



