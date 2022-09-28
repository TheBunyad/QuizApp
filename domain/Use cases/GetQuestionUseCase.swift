//
//  GetQuestionUseCase.swift
//  domain
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import Promises

public class GetQuestionsUseCase {
    
    private let repo: QuestionRepoProtocol
    
    public init(repo: QuestionRepoProtocol) {
        self.repo = repo
    }
        
    public func execute(category: String) -> Promise<[QuestionEntity]> {
        repo.getQuestions(category: category)
    }
}
