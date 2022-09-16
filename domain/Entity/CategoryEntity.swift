//
//  CategoryEntity.swift
//  domain
//
//  Created by Bunyad Majidzade on 13.09.22.
//

import Foundation

public struct CategoryEntity {
    public let id: Int
    public let name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
