//
//  GetQuestionUseCase.swift
//  domain
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import Promises

public class GetQuestionUseCase {
    
    private let repo: QuestionRepoProtocol
    
    public init(repo: QuestionRepoProtocol) {
        self.repo = repo
    }
        
    public func execute() -> Promise<QuestionEntity> {
        repo.getQuestion()
    }
}
