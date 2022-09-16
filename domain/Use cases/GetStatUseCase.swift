//
//  GetStatUseCase.swift
//  domain
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import Promises

public class GetStatUseCase {
    
    private let repo: StatsRepoProtocol
    
    public init(repo: StatsRepoProtocol) {
        self.repo = repo
    }
    
    public func execute() {
//        repo.getStats()
    }
}
