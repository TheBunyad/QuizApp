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
    func getQuestion() -> Promise<QuestionEntity>
    func observerQuestion() -> Observable<QuestionEntity>
}
