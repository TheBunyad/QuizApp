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
        
//        container.register(ResultViewModel.self) { r in
//            return ResultViewModel(score: <#T##Int#>, difficlty: <#T##Difficulty#>, category: <#T##Int#>)
//        }
    }
}
