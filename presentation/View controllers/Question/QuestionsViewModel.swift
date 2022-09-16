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

public class QuestionsViewModel {
    
    private var getUserUseCase: GetUserUseCase
    private var getQuestionUseCase: GetQuestionUseCase
    private var syncQuestionUseCase: SyncQuestionUseCase
    private var observeQuestionUseCase: ObserveQuestionUseCase
    
    private var questionObserver = BehaviorSubject<QuestionEntity?>.init(value: nil)
    private var questionSubscriptin: Disposable? = nil
    private var questions: [QuestionEntity] = []
    private var questionNumber = -1
    private var numberOfQuestoins = 10
    private var numberOfCorrectAnswers = 0
    public var disposebag = DisposeBag()
    private var correctAnswer: String?
    private var blue = UIColor(red: 0.208, green: 0.339, blue: 0.675, alpha: 1)
    
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
    
    func getQuestion(category: Int) -> Promise<[QuestionEntity]> {
        let useCase = self.getQuestionUseCase
        
        return useCase.execute(category: category)
    }
    
    func syncQuestion(category: Int) {
        let _ = self.syncQuestionUseCase.execute(category: category)
    }
    
    func observeQuestions() -> Observable<[QuestionEntity]> {
        let useCase = self.observeQuestionUseCase
        
        return useCase.execute()
    }
    
    func nextQuestion(category: Int) {
        
        self.getQuestion(category: category)
            .then { recieved in
                self.questionNumber += 1
                if self.questionNumber < self.numberOfQuestoins {
                    self.questionObserver.onNext(recieved[self.questionNumber])
                    self.correctAnswer = recieved[self.questionNumber].correctAnswer
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
    
    func checkAnswer(answer: String?) -> UIColor {
        if answer == self.correctAnswer {
            self.numberOfCorrectAnswers += 1
            return UIColor.systemGreen
        }
        return self.blue
    }
    
    func sendNumberOfCorrectAnswers() -> Int {
         numberOfCorrectAnswers
    }
    
}

