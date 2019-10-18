//
//  QuestionPaper.swift
//  QuizFromScratch
//
//  Created by Sharan on 10/17/19.
//  Copyright © 2019 Sharan. All rights reserved.
//

import Foundation
struct QuestionPaper {
    var questionNumber = 0
    var score = 0 
    var listOfQuestions = [ Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
              Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
              Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
              Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
              Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
              Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
              Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
              Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
              Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
              Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")]
    
    
    func getQuestion() -> String {
        return listOfQuestions[questionNumber].question
    }
    func getAnswer() -> [String] {
        return listOfQuestions[questionNumber].answer
    }
    
   mutating func findingAnswer(userAnswer: String) -> Bool {
        if userAnswer == listOfQuestions[questionNumber].cAnswer {
            return true
            score += 1
        } else {
            return false
        }
    }
    
   mutating func nextQuestion() {
        if questionNumber  < listOfQuestions.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    func progressReport() -> Float {
        return Float(questionNumber) / Float(listOfQuestions.count )
    }

    func scoreRecieved() -> String {
        let realScore = "Score: \(questionNumber)/\(listOfQuestions.count)"
      return realScore
    }
    
}


