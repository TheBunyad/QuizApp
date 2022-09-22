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
        
        container.register(GetQuestionsUseCase.self) { r in
            GetQuestionsUseCase(repo: r.resolve(QuestionRepoProtocol.self)!)
        }
        
        container.register(GetStatUseCase.self) { r in
            GetStatUseCase(repo: r.resolve(StatsRepoProtocol.self)!)
        }
        
//        container.register(SyncQuestionUseCase.self) { r in
//            SyncQuestionUseCase(repo: r.resolve(QuestionRepoProtocol.self)!)
//        }
        
//        container.register(ObserveQuestionUseCase.self) { r in
//            ObserveQuestionUseCase(repo: r.resolve(QuestionRepoProtocol.self)!)
//        }
        
        container.register(GetCategoryUseCase.self) { r in
            GetCategoryUseCase(repo: r.resolve(CategoryRepoProtocol.self)!)
        }
        
//        container.register(GetLoaclQuestionsUseCase.self) { r in
//            GetLoaclQuestionsUseCase(repo: r.resolve(QuestionRepoProtocol.self)!)
//        }
    }
    
    
}
