//
//  PresentetionAssebly.swift
//  presentation
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import Swinject
import domain

public class PresentetionAssebly: Assembly {
    
    public init() {
        
    }
    
    public func assemble(container: Container) {
        
        container.register(CategoryViewModel.self) { r in
            let category = r.resolve(GetCategoryUseCase.self)!
            
            return CategoryViewModel(getCategoryUseCase: category)
        }
        
        container.register(DifficultyViewModel.self) { r in
            return DifficultyViewModel()
        }
        
        container.register(StartViewModel.self) { r in
            return StartViewModel()
        }
        
        container.register(ProfileViewModel.self) { r in
           
            return ProfileViewModel(
                updateRecordUseCase: r.resolve(UpdateRecordUseCase.self)!,
                updateHighestScoreUseCase: r.resolve(UpdateHighestScoreUseCase.self)!,
                updateUserNameUseCase: r.resolve(UpdateUsernameUseCase.self)!,
                getRecordUseCase: r.resolve(GetRecordUseCase.self)!,
                getHighestScoreUseCase: r.resolve(GetHighestScoresUseCase.self)!,
                getUserNameUseCase: r.resolve(GetUserNameUseCase.self)!,
                setDataUseCase: r.resolve(SetDataUseCase.self)!)
        }
        
        
        
//        container.register(ResultViewModel.self) { r in
//            return ResultViewModel(score: <#T##Int#>, difficlty: <#T##Difficulty#>, category: <#T##Int#>)
//        }
    }
}
