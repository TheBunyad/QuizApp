//
//  DataAssembly.swift
//  data
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import Swinject
import domain

public class DataAssembly: Assembly {
    
    public init() {
        
    }
    
    public func assemble(container: Container) {
        container.register(UserRepoProtocol.self) { r in
            UserRepo()
        }
        
        container.register(QuestionRepoProtocol.self) { r in
            QuestionRepo()
        }
        
        container.register(StatsRepoProtocol.self) { r in
            StatsRepo()
        }
    }
    
    
}
