//
//  QuestionsEntity.swift
//  domain
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation

public struct QuestionEntity: Decodable {
    
    public let responseCode: Int
    public let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case results, responseCode = "response_code"
    }
    
    public init(responseCode: Int, results: [Result]) {
        self.responseCode = responseCode
        self.results = results
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
