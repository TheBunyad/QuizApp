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
        
        container.register(GetQuestionsUseCase.self) { r in
            GetQuestionsUseCase(repo: r.resolve( QuestionRepoProtocol.self)!)
        }

        container.register(GetCategoryUseCase.self) { r in
            GetCategoryUseCase(repo: r.resolve(CategoryRepoProtocol.self)!)
        }
        
        container.register(UpdateRecordUseCase.self) { r in
            UpdateRecordUseCase(repo: r.resolve(ProfileRepoProtocol.self)!)
        }
        
        container.register(UpdateHighestScoreUseCase.self) { r in
            UpdateHighestScoreUseCase(repo: r.resolve(ProfileRepoProtocol.self)!)
        }
        
        container.register(UpdateUsernameUseCase.self) { r in
            UpdateUsernameUseCase(repo: r.resolve(ProfileRepoProtocol.self)!)
        }
        
        container.register(GetRecordUseCase.self) { r in
            GetRecordUseCase(repo: r.resolve(ProfileRepoProtocol.self)!)
        }
        
        container.register(GetHighestScoresUseCase.self) { r in
            GetHighestScoresUseCase(repo: r.resolve(ProfileRepoProtocol.self)!)
        }
        
        container.register(GetUserNameUseCase.self) { r in
            GetUserNameUseCase(repo: r.resolve(ProfileRepoProtocol.self)!)
        }
        
        container.register(SetDataUseCase.self) { r in
            SetDataUseCase(repo: r.resolve(ProfileRepoProtocol.self)!)
        }

    }
    
}
