////
////  QuestionLocalDTO.swift
////  data
////
////  Created by Bunyad Majidzade on 03.09.22.
////
//
//import Foundation
//import domain
//import RealmSwift
//
//class QuestionLocalDTO: Object {
//    @Persisted var responseCode: Int = 0
//    @Persisted var results: List<Questions>
////    private var arrResults:
//    
//    
//    enum CodingKeys: String, CodingKey {
//        case results, responseCode = "response_code"
//    }
//    
//    convenience init(responseCode: Int, results: [Result]) {
//        self.init()
//        self.responseCode = responseCode
//        self.results.append(
//            objectsIn: results.map { result in
//                Questions(
//                    category: result.category,
//                    type: result.type,
//                    difficulty: result.difficulty,
//                    question: result.question,
//                    correctAnswer: result.correctAnswer,
//                    incorrectAnswers: result.incorrectAnswers
//                )
//            }
//        )
//    }
//    
//    func toDomain() -> QuestionEntity {
//        
//        return QuestionEntity(
//            responseCode: responseCode, results: results.map({ <#Questions#> in
//                <#code#>
//            }))
//    }
//}
