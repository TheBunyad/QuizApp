//
//  SetDataUseCase.swift
//  domain
//
//  Created by Bunyad Majidzade on 26.09.22.
//

import Foundation
import Promises

public class SetDataUseCase {
    
    private let repo: ProfileRepoProtocol
    
    public init(repo: ProfileRepoProtocol) {
        self.repo = repo
    }
        
    public func execute(userName: String, highestScores: [GameEntity], records: [GameEntity]) -> Promise<Void> {
        repo.setData(userName: userName, highestScores: highestScores, records: records)
    }
}
