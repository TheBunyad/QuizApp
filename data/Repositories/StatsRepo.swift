//
//  StatsRepo.swift
//  data
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import Promises
import RxSwift
import domain

public class StatsRepo: StatsRepoProtocol {
    public func getStats() -> Promise<StatsEntity> {
        let pendingData = Promise<StatsEntity>.pending()
        
        // get stats data from server or database
        
        return pendingData
    }
    
    public func observeStats() -> Observable<StatsEntity> {
        let behaviorSubject = BehaviorSubject<StatsEntity?>.init(value: nil)
        
        // return observed data
        
        return behaviorSubject
            .filter { stat in
                stat != nil
            }
            .map { stat in
                stat!
            }
            .asObservable()
    }
    
    
}
