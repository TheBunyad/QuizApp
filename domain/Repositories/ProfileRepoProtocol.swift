//
//  ProfileRepoProtocol.swift
//  domain
//
//  Created by Bunyad Majidzade on 24.09.22.
//

import Foundation
import Promises

public protocol ProfileRepoProtocol {
    func updateRecord(lastGame: GameEntity) -> Promise<Void>
    func updateHighestScore(gameScore: GameEntity) -> Promise<Void>
    func updateUserName(userName: String) -> Promise<Void>
    
    func getRecords() -> Promise<[GameEntity]>
    func getHighestScores() -> Promise<[GameEntity]>
    func getUserName() -> Promise<String>

    func setData(userName: String, highestScores: [GameEntity], records: [GameEntity]) -> Promise<Void>
}
