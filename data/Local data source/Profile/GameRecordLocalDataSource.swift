//
//  GameRecordLocalDataSource.swift
//  data
//
//  Created by Bunyad Majidzade on 23.09.22.
//

import Foundation
import Realm
import RealmSwift
import domain
import Promises

class GameRecordLocalDataSource: GameRecordLocalDataSourceProtocol {
    
    
    
    private let realm: Realm
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    func updateRecord(lastGame: GameRecord) -> Promises.Promise<Void> {
        let promise = Promise<Void>.pending()
        let profiles = realm.objects(Profile.self)
        
        do {
            if let profile = profiles.first {
                try self.realm.write({
                    print("update record: \(profile)")
                    if profile.records.count == 5 {
                        profile.records.removeFirst()
                        profile.records.append(lastGame)
                    } else {
                        profile.records.append(lastGame)
                    }
                })
            } else {
                profiles.first?.records.append(lastGame)
            }
            promise.fulfill(Void())
        } catch {
            promise.reject(error)
        }
        return promise
    }
    
    func updateHighestScore(gameScore: GameScore) -> Promises.Promise<Void> {
        let promise = Promise<Void>.pending()
        let profiles = realm.objects(Profile.self)
        
        do {
            if let profile = profiles.first {
                try self.realm.write({
                    profile.highScores.forEach { score in
                        if score.categoryName == gameScore.categoryName && score.score < gameScore.score {
                            score.score = gameScore.score
                        }
                    }
                })
            } else {
                print("NO data updateHighestScore Local Data Source")
            }
            promise.fulfill(Void())
        } catch {
            promise.reject(error)
        }
        
        return promise
    }
    
    func updateUserName(userName: String) -> Promise<Void> {
        let promise = Promise<Void>.pending()
        let profiles = self.realm.objects(Profile.self)
        
        do {
            if let profile = profiles.first {
                try realm.write({
                    profile.userName = userName
                })
            }
            promise.fulfill(Void())
        } catch {
            promise.reject(error)
        }
        return promise
    }
    
    
    func getRecords() -> Promise<[GameEntity]> {
        let promise = Promise<[GameEntity]>.pending()
        let profiles = self.realm.objects(Profile.self)
        
        if let profile = profiles.first {
            promise.fulfill(
                profile.records.map({ record in
                    GameEntity(
                        categoryName: record.categoryName,
                        score: record.score
                    )
                })
            )
        }
        else {
            promise.reject(NSError(domain: "error", code: 404))
        }
        
        return promise
    }
    
    func getHighestScores() -> Promise<[GameEntity]> {
        let promise = Promise<[GameEntity]>.pending()
        let profile = self.realm.objects(Profile.self)
        
        profile.forEach { profile in
            promise.fulfill(
                profile.highScores.map({ scores in
                    GameEntity(
                        categoryName: scores.categoryName,
                        score: scores.score
                    )
                }))
        }
        
        
        return promise
    }
    
    func getUserName() -> Promise<String> {
        let promise = Promise<String>.pending()
        let profile = self.realm.objects(Profile.self)
        
        profile.forEach { profile in
            promise.fulfill(profile.userName)
        }
        
        return promise
    }
    
    
    func setHighestScore(highestScores: [GameEntity]) -> Promise<Void> {
        let promise = Promise<Void>.pending()
        var newScores = [GameScore]()
        highestScores.forEach { score in
            newScores.append(
                GameScore(categoryName:
                            score.categoryName,
                          score: score.score)
            )
        }
        do {
            try self.realm.write({
                self.realm.add(newScores)
            })
            promise.fulfill(Void())
        } catch {
            promise.reject(error)
        }
        return promise
    }
    
    func setData(userName: String, highestScores: [GameEntity], records: [GameEntity]) -> Promises.Promise<Void> {
        let promise = Promise<Void>.pending()
        let newScores = List<GameScore>()
        let newRecords = List<GameRecord>()
        let newUsername = userName
        highestScores.forEach { score in
            newScores.append(
                GameScore(categoryName:
                            score.categoryName,
                          score: score.score)
            )
        }
        records.forEach { record in
            newRecords.append(
                GameRecord(categoryName: record.categoryName,
                           score: record.score)
            )
        }
        let newProfile = Profile(userName: newUsername, records: newRecords, highScores: newScores)
        do {
            try self.realm.write({
                self.realm.add(newProfile)
            })
            promise.fulfill(Void())
        } catch {
            promise.reject(error)
        }
        return promise
    }
    
    
    
}
