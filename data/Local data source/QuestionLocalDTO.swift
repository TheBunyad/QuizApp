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
    public let responseCode: Int = 0
    public let results: [Result] = []
    
    enum CodingKeys: String, CodingKey {
        case results, responseCode = "response_code"
    }
    
    func toDomain() -> QuestionEntity {
        return QuestionEntity(
            responseCode: responseCode, results: results)
    }
}
