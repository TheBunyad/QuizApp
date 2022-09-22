//
//  ResultViewModel.swift
//  presentation
//
//  Created by Bunyad Majidzade on 16.09.22.
//

import Foundation

public class ResultViewModel {
    
    private let difficulty: Difficulty
    private let category: Int
    private let score: Int
    
    public init(score: Int, difficlty: Difficulty, category: Int) {
        self.difficulty = difficlty
        self.category = category
        self.score = score
    }
    
    func getScore() -> Int {
        score
    }
    
    func getDifficulty() -> Difficulty {
        difficulty
    }
    
    func getCategory() -> Int {
        category
    }
}
