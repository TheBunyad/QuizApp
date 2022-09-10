//
//  ViewModel.swift
//  presentation
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import Promises
import domain
import RxSwift

public class MainViewModel {
    
    private var getUserUseCase: GetUserUseCase
    private var getQuestionUseCase: GetQuestionUseCase
    private var syncQuestionUseCase: SyncQuestionUseCase
    private var observeQuestionUseCase: ObserveQuestionUseCase
    
    public init(
        getUserUseCase: GetUserUseCase,
        getQuestionUseCase: GetQuestionUseCase,
        syncQuestionUseCase: SyncQuestionUseCase,
        observeQuestionUseCase: ObserveQuestionUseCase
    ) {
        self.getUserUseCase = getUserUseCase
        self.getQuestionUseCase = getQuestionUseCase
        self.syncQuestionUseCase = syncQuestionUseCase
        self.observeQuestionUseCase = observeQuestionUseCase
    }
    
    func getUser() -> Promise<UserEntity> {
        let useCase = self.getUserUseCase
        
        return useCase.execute()
    }
    
    func getQuestion() -> Promise<[QuestionEntity]> {
        let useCase = self.getQuestionUseCase
        
        return useCase.execute()
    }
    
    func syncQuestion() {
        let _ = self.syncQuestionUseCase.execute()
    }
    
    func observeQuestion() -> Observable<[QuestionEntity]> {
        let useCase = self.observeQuestionUseCase
        
        return useCase.execute()
    }
    
    
    
    
}

