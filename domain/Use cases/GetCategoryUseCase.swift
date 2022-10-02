//
//  GetCategoryUseCase.swift
//  domain
//
//  Created by Bunyad Majidzade on 13.09.22.
//

import Foundation
import Promises

public class GetCategoryUseCase {
    
    private let repo: CategoryRepoProtocol
    
    public init(repo: CategoryRepoProtocol) {
        self.repo = repo
    }
        
    public func execute() -> Promise<[CategoryEntity]> {
        repo.getCategory()
    }
}
