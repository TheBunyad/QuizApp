//
//  GameRecordLoaclDTO.swift
//  data
//
//  Created by Bunyad Majidzade on 22.09.22.
//

import Foundation
import Realm
import RealmSwift

class GameRecord: Object {
    @Persisted var categoryName: String = ""
    @Persisted var score: Int = 0
    
    convenience init(categoryName: String, score: Int) {
        self.init()
        self.categoryName = categoryName
        self.score = score
    }
}

class GameScore: Object {
    @Persisted var categoryName: String = ""
    @Persisted var score: Int = 0
    
    convenience init(categoryName: String, score: Int) {
        self.init()
        self.categoryName = categoryName
        self.score = score
    }
}


class Profile: Object {
    @Persisted var userName: String
    @Persisted var records = List<GameRecord>()
    @Persisted var highScores = List<GameScore>()
    
    convenience init(userName: String, records: List<GameRecord>, highScores: List<GameScore>) {
        self.init()
        self.userName = userName
        self.records = records
        self.highScores = highScores
    }
}
