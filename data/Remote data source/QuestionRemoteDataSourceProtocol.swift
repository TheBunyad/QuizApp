//
//  QuestionRemoteDataSourceProtocol.swift
//  data
//
//  Created by Bunyad Majidzade on 03.09.22.
//

import Foundation
import Promises


protocol QuestionRemoteDataSourceProtocol {
    func fetchQuestions() -> Promise<QuestionRemoteDTO>
}
