//
//  UpdateUsernameUseCase.swift
//  domain
//
//  Created by Bunyad Majidzade on 26.09.22.
//

import Foundation
import Promises

public class UpdateUsernameUseCase {
    
    private let repo: ProfileRepoProtocol
    
    public init(repo: ProfileRepoProtocol) {
        self.repo = repo
    }
        
    public func execute(userName: String) -> Promise<Void> {
        repo.updateUserName(userName: userName)
    }
}
