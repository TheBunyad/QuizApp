//
//  QuestionsEntity.swift
//  domain
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation


public struct QuestionEntity {
    
    public let category: String
    public let type: String
    public let difficulty: String
    public let question: String
    public let correctAnswer: String
    public let incorrectAnswers: [String]

    public init(category: String, type: String, difficulty: String, question: String, correctAnswer: String, incorrectAnswers: [String]) {
        self.category = category
        self.type = type
        self.difficulty = difficulty
        self.question = question
        self.correctAnswer = correctAnswer
        self.incorrectAnswers = incorrectAnswers
    }
}

public struct Result: Decodable {
    public let category: String
    public let type: String
    public let difficulty: String
    public let question: String
    public let correctAnswer: String
    public let incorrectAnswers: [String]
    
    enum CodingKeys: String, CodingKey {
        case category, type, difficulty, question, correctAnswer = "correct_answer", incorrectAnswers = "incorrect_answers"
    }
    
    init(category: String, type: String, difficulty: String, question: String, correctAnswer: String, incorrectAnswers: [String]) {
        self.category = category
        self.type = type
        self.difficulty = difficulty
        self.question = question
        self.correctAnswer = correctAnswer
        self.incorrectAnswers = incorrectAnswers
    }
}
