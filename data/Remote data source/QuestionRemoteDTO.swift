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
    
    func toDomain() -> QuestionEntity {
        return QuestionEntity(
            responseCode: responseCode, results: results)
    }
}
