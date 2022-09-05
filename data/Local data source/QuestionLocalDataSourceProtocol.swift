//
//  QuestionLocalDataSourceProtocol.swift
//  data
//
//  Created by Bunyad Majidzade on 03.09.22.
//

import Foundation
import RxSwift
import Promises

protocol QuestionLocalDataSourceProtocol {
    func save(questionDTO: QuestionLocalDTO) -> Promise<Void>
    func observeQuestion() -> Observable<QuestionLocalDTO>
}
