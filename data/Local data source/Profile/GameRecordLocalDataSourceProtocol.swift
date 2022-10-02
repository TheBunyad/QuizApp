//
//  GameRecordLocalDataSourceProtocol.swift
//  data
//
//  Created by Bunyad Majidzade on 22.09.22.
//

import Foundation
import domain
import Promises

protocol GameRecordLocalDataSourceProtocol {
    
    func updateRecord(lastGame: GameRecord) -> Promise<Void>
    func updateHighestScore(gameScore: GameScore) -> Promise<Void>
    func updateUserName(userName: String) -> Promise<Void>
    
    func getRecords() -> Promise<[GameEntity]>
    func getHighestScores() -> Promise<[GameEntity]>
    func getUserName() -> Promise<String>

    func setData(userName: String, highestScores: [GameEntity], records: [GameEntity]) -> Promise<Void>
}
