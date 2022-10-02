//
//  GetUserNameUseCase.swift
//  domain
//
//  Created by Bunyad Majidzade on 26.09.22.
//

import Foundation
import Promises

public class GetUserNameUseCase {
    
    private let repo: ProfileRepoProtocol
    
    public init(repo: ProfileRepoProtocol) {
        self.repo = repo
    }
        
    public func execute() -> Promise<String> {
        repo.getUserName()
    }
}
