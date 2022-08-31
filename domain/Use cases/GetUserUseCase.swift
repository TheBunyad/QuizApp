//
//  getUserUseCase.swift
//  domain
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import Promises

public class GetUserUseCase {
    
    private let repo: UserRepoProtocol
    
    public init(repo: UserRepoProtocol) {
        self.repo = repo
    }
    
    public func execute() -> Promise<UserEntity> {
        return repo.getUser()
    }
}
