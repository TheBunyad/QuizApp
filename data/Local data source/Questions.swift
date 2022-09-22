//
//  Questions.swift
//  data
//
//  Created by Bunyad Majidzade on 07.09.22.
//

import Foundation
import domain
import RealmSwift

//class Questions: Object {
//    
//    @Persisted var category: String = ""
//    @Persisted var type: String = ""
//    @Persisted var difficulty: String = ""
//    @Persisted var question: String = ""
//    @Persisted var correctAnswer: String = ""
//    @Persisted var incorrectAnswers: List<String>
//    
//    convenience init(category: String, type: String, difficulty: String, question: String, correctAnswer: String, incorrectAnswers: [String]) {
//        self.init()
//        self.category = category
//        self.type = type
//        self.difficulty = difficulty
//        self.question = question
//        self.correctAnswer = correctAnswer
//        self.incorrectAnswers.append(objectsIn: incorrectAnswers)
//    }
//    
//    func toDomain() -> QuestionEntity {
//        QuestionEntity(
//            category: self.category,
//            type: self.type,
//            difficulty: self.difficulty,
//            question: self.question,
//            correctAnswer: self.correctAnswer,
//            incorrectAnswers: self.incorrectAnswers.map { $0 }
//        )
//    }
//}
