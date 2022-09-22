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
import RxRelay
import UIKit

public class QuestionsViewModel {
    
    public var disposebag = DisposeBag()
    private let difficulty: Difficulty
    private let category: Int
    private var questions: [QuestionEntity] = []
    private var answers: [AnswerState] = []
    private var currentIndex = -1
    private let gameStateRelay: BehaviorRelay<GameState> = BehaviorRelay.init(value: .pending)
    private lazy var questionStateRelay: BehaviorRelay<QuestionState> = {
        BehaviorRelay.init(value: .pending(remainingSec: timerLimit))
    }()
    
    private var timer: Timer?
    var questionsCount: Int {
        get {
            self.questions.count
        }
    }
    
    var correctAnswerCount: Int {
        get {
            answers.filter { answer in
                answer == .correct
            }.count
        }
        
    }
    private var timerLimit: Int {
        get {
            switch difficulty {
            case .easy:
                return 20
            case .medium:
                return 15
            case .hard:
                return 10
            }
        }
        
    }
    
    public init(
        difficult: Difficulty,
        category: Int,
        multiplayer: Bool,
        getQuestionsUseCase: GetQuestionsUseCase
    ) {
        self.difficulty = difficult
        self.category = category
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTick), userInfo: nil, repeats: true)
        
        getQuestionsUseCase.execute(category: category)
            .then { questions in
                self.questions = questions
                self.next()
            }
    }
    
    func observeGameState() -> Observable<GameState> {
        return self.gameStateRelay.asObservable()
    }
    
    func observeQuestionState() -> Observable<QuestionState> {
        return self.questionStateRelay.asObservable()
    }
    
    func next() {
        switch self.gameStateRelay.value {
        case .pending:
            currentIndex = 0
            self.gameStateRelay.accept(
                .inProgress(
                    question: self.questions[currentIndex]
                )
            )
        case .inProgress(question: _):
            currentIndex += 1
            if currentIndex < self.questionsCount {
                self.gameStateRelay.accept(
                    .inProgress(
                        question: self.questions[currentIndex]
                    )
                )
            }
            else {
                self.gameStateRelay.accept(.completed)
            }
            
        default:
            break
        }
        
        self.questionStateRelay.accept(.pending(remainingSec: timerLimit))
    }
    
    @objc func onTick() {
        let state = self.gameStateRelay.value
        
        switch state {
        case .inProgress(_):
            let state = self.questionStateRelay.value
            switch state {
            case .pending(let remainingTime):
                if remainingTime > 0 {
                    self.questionStateRelay.accept(.pending(remainingSec: remainingTime - 1))
                } else {
                    self.questionStateRelay.accept(.timeout)
                    self.answers.append(.wrong)
                }
            default:
                break
            }
        case .completed:
            break
        case .pending:
            break
        }
        
    }
    
    func select(option: String) {
        let state = self.gameStateRelay.value
        
        switch state {
        case .inProgress(let question):
            let questionState = self.questionStateRelay.value
            
            switch questionState {
            case .pending(_):
                if option == getCorrectAnswer(correctAnswer: question.correctAnswer) {
                    self.questionStateRelay.accept(.correct)
                    self.answers.append(.correct)
                } else {
                    self.questionStateRelay.accept(.wrong(option: option))
                    self.answers.append(.wrong)
                }
            default:
                break
            }
        default:
            break
        }
    }
    
    func isLastQuestion() -> Bool {
        return self.currentIndex == self.questionsCount - 1
    }
    
    func getCurrentIndex() -> Int {
        self.currentIndex
    }
    
    func getDifficulty() -> Difficulty {
        self.difficulty
    }
    
    func getCategory() -> Int {
        self.category
    }
    
    func stringFormatter( text: String) -> String {
        var newtext = text
        newtext = newtext.replacingOccurrences(of: "&#039;", with: "`")
        newtext = newtext.replacingOccurrences(of: "&quot;", with: "\"")
        newtext = newtext.replacingOccurrences(of: "&shy;", with: "-")
        return newtext
    }
    
    func getCorrectAnswer( correctAnswer: String) -> String {
        let text: String = correctAnswer
         return stringFormatter(text: text)
    }
}

enum GameState {
    case pending,
         inProgress(
            question: QuestionEntity),
         completed
}

enum QuestionState {
    case pending(remainingSec: Int)
    case wrong(option: String)
    case correct
    case timeout
}

enum AnswerState {
    case correct, wrong
}
