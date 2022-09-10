//
//  QuestionRemoteDTO.swift
//  data
//
//  Created by Bunyad Majidzade on 03.09.22.
//

import Foundation
import domain

struct QuestionRemoteDTO: Decodable {
    
    public let responseCode: Int
    public let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case results, responseCode = "response_code"
    }
    
    func toDomain() -> [QuestionEntity] {
        self.results.map { result in
            QuestionEntity(
                category: result.category,
                type: result.type,
                difficulty: result.difficulty,
                question: result.question,
                correctAnswer: result.correctAnswer,
                incorrectAnswers: result.incorrectAnswers
            )
        }
    }
    
    func toLocal() -> [Questions] {
        return results.map { remoteDTO in
            Questions(
                category: remoteDTO.category,
                type: remoteDTO.type,
                difficulty: remoteDTO.difficulty,
                question: remoteDTO.question,
                correctAnswer: remoteDTO.correctAnswer,
                incorrectAnswers: remoteDTO.incorrectAnswers)
        }
    }
}
