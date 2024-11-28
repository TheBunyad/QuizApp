//
//  ProfileRepo.swift
//  data
//
//  Created by Bunyad Majidzade on 24.09.22.
//

import Foundation
import Promises
import Realm
import RealmSwift
import domain

public class ProfileRepo: ProfileRepoProtocol {
    
    
    private let localDataSource: GameRecordLocalDataSourceProtocol
    
    init(loaclDataSource: GameRecordLocalDataSourceProtocol) {
        self.localDataSource = loaclDataSource
    }
    
    public func setData(userName: String, highestScores: [GameEntity], records: [GameEntity]) -> Promise<Void> {
        let promise = Promise<Void>.pending()
        
        localDataSource.setData(userName: userName, highestScores: highestScores, records: records
        ).then { _ in
            promise.fulfill(Void())
        }.catch { error in
            promise.reject(error)
        }
        
        return promise
    }
    
    public func updateRecord(lastGame: GameEntity) -> Promise<Void> {
        let promise = Promise<Void>.pending()
        localDataSource.updateRecord(
            lastGame: GameRecord(
            categoryName: lastGame.categoryName,
            score: lastGame.score)
        ).then { _ in
            promise.fulfill(Void())
        }.catch { error in
            print("error Profile Repo")
            promise.reject(error)
        }
        
        return promise
    }
    
    public func updateHighestScore(gameScore: GameEntity) -> Promises.Promise<Void> {
        let promise = Promise<Void>.pending()
        print("Profile repo: \(gameScore)")
        localDataSource.updateHighestScore(
            gameScore: GameScore(
            categoryName: gameScore.categoryName,
            score: gameScore.score)
        ).then { _ in
            promise.fulfill(Void())
        }.catch { error in
            promise.reject(error)
        }
        
        return promise
    }
    
    public func updateUserName(userName: String) -> Promises.Promise<Void> {
        let promise = Promise<Void>.pending()
        
        localDataSource.updateUserName(
            userName: userName
        ).then { _ in
            promise.fulfill(Void())
        }.catch { error in
            promise.reject(error)
        }
        
        return promise
    }
    
    public func getRecords() -> Promise<[GameEntity]> {
        let promise = Promise<[GameEntity]>.pending()
        
        localDataSource.getRecords()
            .then { records in
            promise.fulfill(records)
        }.catch { error in
            promise.reject(error)
        }
        
        return promise
    }
    
    public func getHighestScores() -> Promise<[GameEntity]> {
        let promise = Promise<[GameEntity]>.pending()
        
        localDataSource.getHighestScores()
            .then { scores in
            promise.fulfill(scores)
        }.catch { error in
            promise.reject(error)
        }
        
        return promise
    }
    
    public func getUserName() -> Promise<String> {
        let promise = Promise<String>.pending()
        
        localDataSource.getUserName()
            .then { userName in
            promise.fulfill(userName)
        }.catch { error in
            promise.reject(error)
        }
        
        return promise
    }
    
    
}
