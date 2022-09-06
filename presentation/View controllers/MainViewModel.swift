//
//  ViewModel.swift
//  presentation
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import Promises
import domain

public class MainViewModel {
    
    private var getUserUseCase: GetUserUseCase?
    private var getQuestionUseCase: GetQuestionUseCase?
    
    
    public init(getUserUseCase: GetUserUseCase?, getQuestionUseCase: GetQuestionUseCase?) {
        self.getUserUseCase = getUserUseCase
        self.getQuestionUseCase = getQuestionUseCase
    }
    
    func getUser() -> Promise<UserEntity>? {
        let useCase = self.getUserUseCase
        
        return useCase?.execute()
    }
    
    func getQuestion() -> Promise<QuestionEntity>? {
        let useCase = self.getQuestionUseCase
        
        return useCase?.execute()
    }
    
    
}

