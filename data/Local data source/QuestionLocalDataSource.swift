//
//  QuestionLocalDataSource.swift
//  data
//
//  Created by Bunyad Majidzade on 03.09.22.
//

import Foundation
import RxSwift
import Promises
import RealmSwift
import RxRelay

class QuestionLocalDataSource: QuestionLocalDataSourceProtocol {
    
    
    private let questionRelay = BehaviorRelay<[Questions]>.init(value: [])

    func save(questionDTO: [Questions]) -> Promise<Void> {
        let promise = Promise<Void>.pending()
        self.questionRelay.accept(questionDTO)
        promise.fulfill(Void())
        
        return promise
    }

    func observeQuestions() -> Observable<[Questions]> {
        return self.questionRelay.asObservable()
    }
    
    
}
