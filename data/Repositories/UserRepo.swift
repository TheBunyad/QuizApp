//
//  UserRepo.swift
//  data
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import domain
import RxSwift
import Promises

class UserRepo: UserRepoProtocol {
    func getUser() -> Promise<UserEntity> {
        let pendingData = Promise<UserEntity>.pending()
        
        // async call data
        pendingData.fulfill(
            UserEntity(
                userName: "User",
                email: "user@example.com",
                password: "11111111"))
        
        return pendingData
    }
    
    func observeUSer() -> Observable<UserEntity> {
        let behaviourSubject = BehaviorSubject<UserEntity?>.init(value: nil)
        
        // return observed data
        
        return behaviourSubject
            .filter ({ user in
                user != nil
            })
            .map ({ user in
                user!
            })
            .asObservable()
        
    }
    
    
}
