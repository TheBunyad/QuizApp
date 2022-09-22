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

//class QuestionLocalDataSource: QuestionLocalDataSourceProtocol {
//    private var questions: [Questions] = []
////    
////    func getLocalQuestions() -> Promise<[Questions]> {
////        let promise = Promise<[Questions]>.pending()
////        promise.fulfill(questions)
////        
////        return promise
////    }
//    
//    
//    
//    private let realm: Realm
//    private let questionRelay = BehaviorRelay<[Questions]>.init(value: [])
//
//    init(realm: Realm) {
//        self.realm = realm
//        let cache = realm.objects(Questions.self).freeze().map { $0 } as [Questions]
//        questionRelay.accept(cache)
//    }
//    
//    func save(questionDTO: [Questions]) -> Promise<Void> {
//        let promise = Promise<Void>.pending()
//        let oldObjs = self.realm.objects(Questions.self)
//        do {
//            try self.realm.write {
//                self.realm.delete(oldObjs)
//                self.realm.add(questionDTO)
//            }
//            self.questionRelay.accept(questionDTO)
//            promise.fulfill(Void())
//        } catch {
//            promise.reject(error)
//        }
//        
//        
//        return promise
//    }
//
//    func observeQuestions() -> Observable<[Questions]> {
//        return self.questionRelay.asObservable()
//    }
//    
//    
//}
