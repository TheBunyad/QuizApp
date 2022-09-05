//
//  QuestionLocalDTO.swift
//  data
//
//  Created by Bunyad Majidzade on 03.09.22.
//

import Foundation
import domain
import RealmSwift

class QuestionLocalDTO: Object {
    @Persisted var question: String = ""
    @Persisted var correctAnswer: String = ""
    @Persisted var answer1: String = ""
    @Persisted var answer2: String = ""
    @Persisted var answer3: String = ""
    
    func toDomain() -> QuestionEntity {
        return QuestionEntity(
            question: self.question,
            correctAnswer: self.correctAnswer,
            answer1: self.answer1,
            answer2: self.answer2,
            answer3: self.answer3)
    }
}
