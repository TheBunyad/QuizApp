//
//  QuestionRepo.swift
//  data
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import domain
import RxSwift
import Promises

public class QuestionRepo: QuestionRepoProtocol {
    public func getQuestion() -> Promise<QuestionEntity> {
        let pendingData = Promise<QuestionEntity>.pending()
        
        // get data from server or DataBase
        pendingData.fulfill(QuestionEntity(question: "What is an Oak?", correctAnswer: "tree", answer1: "animal", answer2: "mushroom", answer3: "human"))
        
        return pendingData
    }
    
    public func observerQuestion() -> Observable<QuestionEntity> {
        let behaviourSubject = BehaviorSubject<QuestionEntity?>.init(value: nil)
        
        // return observed data
        
        return behaviourSubject
            .filter { question in
                question != nil
            }
            .map { question in
                question!
            }
            .asObservable()
    }
    
    
}
