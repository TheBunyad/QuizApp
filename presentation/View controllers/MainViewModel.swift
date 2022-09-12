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
import UIKit

public class MainViewModel {
    
    private var getUserUseCase: GetUserUseCase
    private var getQuestionUseCase: GetQuestionUseCase
    private var syncQuestionUseCase: SyncQuestionUseCase
    private var observeQuestionUseCase: ObserveQuestionUseCase
    
    private var questionObserver = BehaviorSubject<QuestionEntity?>.init(value: nil)
    private var questionSubscriptin: Disposable? = nil
    private var questions: [QuestionEntity] = []
    private var questionNumber = -1
    private var numberOfQuestoins = 10
    public var disposebag = DisposeBag()
    
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
    
    func observeQuestions() -> Observable<[QuestionEntity]> {
        let useCase = self.observeQuestionUseCase
        
        return useCase.execute()
    }
    
    func nextQuestion() {
        
        self.getQuestion()
            .then { recieved in
                self.questionNumber += 1
                if self.questionNumber < self.numberOfQuestoins {
                    self.questionObserver.onNext(recieved[self.questionNumber])
                }
                if self.questionNumber == self.numberOfQuestoins - 1 {
                    self.questionObserver.onCompleted()
                }
            }
    }
    
    func observeQuestion() -> BehaviorSubject<QuestionEntity?> {
        return questionObserver
    }
    
    func dispose(of subscriber: Disposable?) {
        subscriber?.disposed(by: disposebag)
    }
    
}

