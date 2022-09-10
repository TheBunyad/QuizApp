//
//  SyncQuestionUseCase.swift
//  domain
//
//  Created by Bunyad Majidzade on 07.09.22.
//

import Foundation
import Promises

public class SyncQuestionUseCase {
    
    private let repo: QuestionRepoProtocol
    
    public init(repo: QuestionRepoProtocol) {
        self.repo = repo
    }
        
    public func execute() -> Promise<Void> {
        repo.syncQuestion()
    }
}
