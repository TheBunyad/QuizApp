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
                    if profile.records.count == 5 {
                        profile.records.remove(at: 4)
                        profile.records.insert(lastGame, at: 0)
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
            print("Latest Game: \(gameScore)")
            print("GR Data Source: \(realm.objects(Profile.self))")
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
        let profiles = self.realm.objects(Profile.self)
        
        if let profile = profiles.first {
            promise.fulfill(
                profile.highScores.map({ scores in
                    GameEntity(
                        categoryName: scores.categoryName,
                        score: scores.score
                    )
                })
            )
            print("Realm has: \(self.realm.objects(Profile.self))")
            print("GR Data Source - Get: \(profile.highScores)")
        } else {
            promise.reject(NSError(domain: "error", code: 404))
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
    
    func setData(userName: String, highestScores: [GameEntity], records: [GameEntity]) -> Promises.Promise<Void> {
        let promise = Promise<Void>.pending()
        let profiles = self.realm.objects(Profile.self)
        let profile = profiles.first
        let deleted = self.realm.objects(GameScore.self)
        do {
            try self.realm.write({
                self.realm.delete(deleted)
                profile?.highScores = writeMaxScores()
            })
            promise.fulfill(Void())
        } catch {
            promise.reject(error)
        }
        return promise
    }
    
    func writeMaxScores() -> List<GameScore> {
        let  list = List<GameScore>()

        let array = [GameScore(categoryName: L10n.anyCategory, score: 0),
            GameScore(categoryName: L10n.generalKnowledge, score: 0),
            GameScore(categoryName: L10n.entertainmentBooks, score: 0),
            GameScore(categoryName: L10n.entertainmentFilm, score: 0),
            GameScore(categoryName: L10n.entertainmentMusic, score: 0),
            GameScore(categoryName: L10n.entertainmentMusicalAndTheatres, score: 0),
            GameScore(categoryName: L10n.entertainmentTelevision, score: 0),
            GameScore(categoryName: L10n.entertainmentVideoGames, score: 0),
            GameScore(categoryName: L10n.entertainmentBoardGames, score: 0),
            GameScore(categoryName: L10n.scienceNature, score: 0),
            GameScore(categoryName: L10n.scienceComputers, score: 0),
            GameScore(categoryName: L10n.scienceMathematics, score: 0),
            GameScore(categoryName: L10n.mythology, score: 0),
            GameScore(categoryName: L10n.sports, score: 0),
            GameScore(categoryName: L10n.geography, score: 0),
            GameScore(categoryName: L10n.history, score: 0),
            GameScore(categoryName: L10n.politics, score: 0),
            GameScore(categoryName: L10n.art, score: 0),
            GameScore(categoryName: L10n.celebrities, score: 0),
            GameScore(categoryName: L10n.animals, score: 0),
            GameScore(categoryName: L10n.vehicles, score: 0),
            GameScore(categoryName: L10n.entertainmentComics, score: 0),
            GameScore(categoryName: L10n.scienceGadgets, score: 0),
            GameScore(categoryName: L10n.entertainmentAnimeManga, score: 0),
            GameScore(categoryName: L10n.entertainmentCartoonAnimations, score: 0),
        ]
        
        list.append(objectsIn: array)
        
        return list
    }
    
    
    
}
