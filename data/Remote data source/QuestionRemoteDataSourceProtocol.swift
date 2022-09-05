//
//  QuestionRemoteDataSourceProtocol.swift
//  data
//
//  Created by Bunyad Majidzade on 03.09.22.
//

import Foundation


protocol QuestionRemoteDataSourceProtocol {
    func fetchQuestions() -> QuestionRemoteDTO
}
