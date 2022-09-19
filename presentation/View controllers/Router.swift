//
//  Router.swift
//  presentation
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import Swinject
import domain
import UIKit

public protocol RouterProtocol {
    
    func questionsViewController(difficulty: Difficulty, category: Int, multiplayer: Bool) -> QuestionsViewController
    func catogoryViewController(difficulty: String, multiplayer: Bool) -> CategoryViewController
    func difficultyViewController(multiplayer: Bool) -> DifficultyViewController
    func startViewController() -> UINavigationController
    func resultViewController(score: Int) -> ResultViewController
    
}

public class Router: RouterProtocol {
    
    private let resolver: Resolver
    
    public init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    public func questionsViewController(difficulty: Difficulty, category: Int, multiplayer: Bool) -> QuestionsViewController {
        
        let question = resolver.resolve(GetQuestionsUseCase.self)!
        
        let vm = QuestionsViewModel(
            difficult: difficulty,
            category: category,
            multiplayer: multiplayer,
            getQuestionsUseCase: question
        )
        
        return QuestionsViewController(vm: vm, router: self)
    }
    
    public func catogoryViewController(difficulty: String, multiplayer: Bool) -> CategoryViewController {
      
        let vc = CategoryViewController(difficulty: difficulty, multiplayer: multiplayer, vm: self.resolver.resolve(CategoryViewModel.self)!, router: self)
        
        return vc
    }
    
    public func difficultyViewController(multiplayer: Bool) -> DifficultyViewController {
        let vc = DifficultyViewController(multiplayer: multiplayer, vm: self.resolver.resolve(DifficultyViewModel.self)!, router: self)
        
        return vc
    }
    
    public func startViewController() -> UINavigationController {
        let vc = StartViewController(vm: self.resolver.resolve(StartViewModel.self)!, router: self)
        let navVC = UINavigationController(rootViewController: vc)
        return navVC
    }
    
    public func resultViewController(score: Int) -> ResultViewController {
        let vc = ResultViewController(score: score, vm: self.resolver.resolve(ResultViewModel.self)!, router: self)
        
        return vc
    }
    
        
}
