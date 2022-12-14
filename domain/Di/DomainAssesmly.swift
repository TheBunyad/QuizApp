//
//  DomainAssesmly.swift
//  domain
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import Swinject


public class DomainAssembly: Assembly {
    
    public init() {
        
    }
    
    public func assemble(container: Container) {
        
        container.register(GetUserUseCase.self) { r in
            GetUserUseCase(repo: r.resolve(UserRepoProtocol.self)!)
        }
        
        container.register(GetQuestionUseCase.self) { r in
            GetQuestionUseCase(repo: r.resolve(QuestionRepoProtocol.self)!)
        }
        
        container.register(GetStatUseCase.self) { r in
            GetStatUseCase(repo: r.resolve(StatsRepoProtocol.self)!)
        }
    }
    
    
}
