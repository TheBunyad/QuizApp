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
    
    private let promise = Promise<Void>.pending()
    private let questionRelay = BehaviorRelay<QuestionLocalDTO?>.init(value: nil)

    func save(questionDTO: QuestionLocalDTO) -> Promise<Void> {
        return promise
    }

    func observeQuestion() -> Observable<QuestionLocalDTO> {
        return self.questionRelay
            .filter { dto in
                dto != nil
            }
            .map { dto in
                dto!
            }
            .asObservable()
    }
    
    
}
