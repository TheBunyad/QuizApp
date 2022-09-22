//
//  QuestionRepoProtocol.swift
//  domain
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import Promises
import RxSwift

public protocol QuestionRepoProtocol {
    func getQuestions(category: Int) -> Promise<[QuestionEntity]>
//    func observerQuestion() -> Observable<[QuestionEntity]>
//    func syncQuestion (category: Int) -> Promise<Void>
//    func getLocalQuestions(category: Int) -> Promise<[QuestionEntity]>
}
