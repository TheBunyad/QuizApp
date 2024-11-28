//
//  ResultViewModel.swift
//  presentation
//
//  Created by Bunyad Majidzade on 16.09.22.
//

import Foundation
import domain

public class ResultViewModel {
    
    private let difficulty: Difficulty
    private let category: String
    private let correctAnswers: Int
    private let score: Int
    private var categoryName: String
    private let updateRecordUseCase: UpdateRecordUseCase
    private let updateHighestScoreUseCase: UpdateHighestScoreUseCase
    
    public init(correctAnswers: Int, score: Int, difficlty: Difficulty, category: String, categoryName: String, updateRecordUseCase: UpdateRecordUseCase, updateHighestScoreUseCase: UpdateHighestScoreUseCase) {
        self.difficulty = difficlty
        self.category = category
        self.correctAnswers = correctAnswers
        self.score = score
        self.categoryName = categoryName
        self.updateRecordUseCase = updateRecordUseCase
        self.updateHighestScoreUseCase = updateHighestScoreUseCase
    }
    
    func updateRecord() {
        self.updateRecordUseCase.execute(
            lastGame: GameEntity(
                categoryName:
                    categoryName, score: score)
        ).then { _ in
            
        }
    }
    
    func updateHighestScore() {
        self.updateHighestScoreUseCase.execute(lastGame: GameEntity(
            categoryName: categoryName, score: score)
        ).then { _ in
            
        }
    }
    
    func getCorrectAnswer() -> Int {
        correctAnswers
    }
    
    func getDifficulty() -> Difficulty {
        difficulty
    }
    
    func getCategory() -> String {
        category
    }
    
    func getScore() -> Int {
        score
    }
    
    func getCategoryName() -> String {
        categoryName
    }
}
