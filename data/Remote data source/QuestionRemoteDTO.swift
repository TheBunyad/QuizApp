//
//  QuestionRemoteDTO.swift
//  data
//
//  Created by Bunyad Majidzade on 03.09.22.
//

import Foundation
import domain

struct QuestionRemoteDTO: Decodable, Equatable {
    
    public let question: String
    public let correctAnswer: String
    public let answer1: String
    public let answer2: String
    public let answer3: String
    
    func toDomain() -> QuestionEntity {
        return QuestionEntity(
            question: self.question,
            correctAnswer: self.correctAnswer,
            answer1: self.answer1,
            answer2: self.answer2,
            answer3: self.answer3)
    }
}
