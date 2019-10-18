//
//  ViewController.swift
//  QuizFromScratch
//
//  Created by Sharan on 10/17/19.
//  Copyright © 2019 Sharan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var questionPaper = QuestionPaper()
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var FirstButton: UIButton!
    @IBOutlet weak var SecondButton: UIButton!
    @IBOutlet weak var ThirdButton: UIButton!
    @IBOutlet weak var progressLabel: UIProgressView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
   
    @IBAction func clickButton(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = questionPaper.findingAnswer(userAnswer: userAnswer)
    //    var other = questionPaper.listOfQuestions[number].cAnswer
        if userGotItRight {
                           sender.backgroundColor = .green
                       } else {
                           sender.backgroundColor = .red
                       }
       questionPaper.nextQuestion()
        
    Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

}
    
    
    
  @objc func updateUI() {
    
    questionLabel.text = questionPaper.getQuestion()
    FirstButton.backgroundColor = .clear
    SecondButton.backgroundColor = .clear
    ThirdButton.backgroundColor = .clear
     findAnswer()
    progressLabel.progress = questionPaper.progressReport()
    scoreLabel.text = questionPaper.scoreRecieved()
    }
    
    
    
    func findAnswer() {
//        let a = questionPaper.listOfQuestions[number].answer[0]
//        let b = questionPaper.listOfQuestions[number].answer[1]
//        let c = questionPaper.listOfQuestions[number].answer[2]
        let answerChoices = questionPaper.getAnswer()
        FirstButton.setTitle(answerChoices[0], for: .normal)
        SecondButton.setTitle( answerChoices[1], for: .normal)
        ThirdButton.setTitle(answerChoices[2], for: .normal)
    }
}

