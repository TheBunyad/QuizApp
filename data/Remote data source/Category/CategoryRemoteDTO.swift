//
//  CategoryRemoteDTO.swift
//  data
//
//  Created by Bunyad Majidzade on 13.09.22.
//

import Foundation
import domain

struct CategoryRemoteDTO: Decodable {
    public let questionCategories: [Category]
    
    enum CodingKeys: String, CodingKey {
        case questionCategories = "trivia_categories"
    }
    
    func toDomain() -> [CategoryEntity] {
        return self.questionCategories.map { result in
            CategoryEntity(id: result.id, name: result.name)
        }
    }
}

struct Category: Decodable {
    public let id: Int
    public let name: String
}


    

