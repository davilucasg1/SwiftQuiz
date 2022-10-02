//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by DS Mac Mini on 02/10/22.
//

import Foundation

class Quiz {
    
    let question: String
    let options: [String]
    private let correctAnswers: String
    
    
    init(question: String, options: [String], correctAnswers: String) {
        self.question = question
        self.options = options
        self.correctAnswers = correctAnswers
    }
    
    func validadeOption(_ index: Int) -> Bool {
        let answer = options[index]
        return answer == correctAnswers
    }
    
    deinit {
        print("liberou o quiz da memoria")
    }
    
}
