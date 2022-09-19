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
    private var questions: [QuestionEntity] = []
    private var answers: [AnswerState] = []
    private var currentIndex = -1
    private let gameStateRelay: BehaviorRelay<GameState> = BehaviorRelay.init(value: .pending)
//    private lazy var questionStateRelay: BehaviorRelay<QuestionState> = {
//        BehaviorRelay.init(value: .pending(remainingSec: timerLimit))
//    }()
    
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
    
    func next() {
        switch self.gameStateRelay.value {
        case .pending:
            currentIndex = 0
        case .inProgress(question: _, state: _):
            if currentIndex < self.questionsCount - 1 {
                currentIndex += 1
            } else {
                self.gameStateRelay.accept(.completed)
                return
            }
        default:
            break
        }
        
        self.gameStateRelay.accept(
            .inProgress(
                question: self.questions[currentIndex],
                state: .pending(remainingSec: timerLimit)
            )
        )
    }
    
    @objc func onTick() {
        let state = self.gameStateRelay.value
        
        switch state {
        case .inProgress(let question, let state):
            switch state {
            case .pending(let remainingSec):
                if remainingSec > 0 {
                    self.gameStateRelay.accept(
                        .inProgress(
                            question: question,
                            state: .pending(
                                remainingSec: remainingSec - 1
                            )
                        )
                    )
                } else {
                    self.gameStateRelay.accept(
                        .inProgress(
                            question: question,
                            state: .timeout
                        )
                    )
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
        case .inProgress(let question, let questionState):
            switch questionState {
            case .pending(_):
                if option == question.correctAnswer {
                    self.gameStateRelay.accept(
                        .inProgress(
                            question: question,
                            state: .correct)
                    )
                    self.timer?.invalidate()
                    self.answers.append(.correct)
                } else {
                    self.gameStateRelay.accept(
                        .inProgress(
                            question: question,
                            state: .wrong( option: option))
                    )
                    self.timer?.invalidate()
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
    
    
}

enum GameState {
    case pending,
    inProgress(
        question: QuestionEntity,
        state: QuestionState),
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
