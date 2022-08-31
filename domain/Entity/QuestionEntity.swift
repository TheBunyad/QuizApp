//
//  QuestionsEntity.swift
//  domain
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation

public struct QuestionEntity {
    
    public let question: String
    public let correctAnswer: String
    public let answer1: String
    public let answer2: String
    public let answer3: String
    
    public init(question: String, correctAnswer: String, answer1: String, answer2: String, answer3: String) {
        self.question = question
        self.correctAnswer = correctAnswer
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
    }
    
}
