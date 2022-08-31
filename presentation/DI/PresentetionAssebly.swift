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
        container.register(MainViewModel.self) { r in
            let user = r.resolve(GetUserUseCase.self)
            let question = r.resolve(GetQuestionUseCase.self)
            return MainViewModel(getUserUseCase: user, getQuestionUseCase: question)
        }
    }
}
