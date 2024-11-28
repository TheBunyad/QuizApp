//
//  UpdateHighestScoreUseCase.swift
//  domain
//
//  Created by Bunyad Majidzade on 24.09.22.
//

import Foundation
import Promises

public class UpdateHighestScoreUseCase {
    
    private let repo: ProfileRepoProtocol
    
    public init(repo: ProfileRepoProtocol) {
        self.repo = repo
    }
        
    public func execute(lastGame: GameEntity) -> Promise<Void> {
        repo.updateHighestScore(gameScore: lastGame)
    }
}
