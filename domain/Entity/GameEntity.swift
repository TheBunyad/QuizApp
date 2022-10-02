//
//  GameEntity.swift
//  domain
//
//  Created by Bunyad Majidzade on 24.09.22.
//

import Foundation
import UIKit

public struct GameEntity {
    public let categoryName: String
    public let score: Int
    
    public init(categoryName: String, score: Int) {
        self.categoryName = categoryName
        self.score = score
    }
}

public struct ProfileEntity {
    public let records: [GameEntity]
    public let highestScores: [GameEntity]
    public let userName: String
    
    init(records: [GameEntity], highestScores: [GameEntity], userName: String) {
        self.records = records
        self.highestScores = highestScores
        self.userName = userName
    }
}
