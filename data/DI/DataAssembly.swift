//
//  DataAssembly.swift
//  data
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import Swinject
import domain
import Alamofire

public class DataAssembly: Assembly {
    
    public init() {
        
    }
    
    public func assemble(container: Container) {
        container.register(UserRepoProtocol.self) { r in
            UserRepo()
        }
        
        container.register(QuestionRepoProtocol.self) { r in
            QuestionRepo(remoteDataSource: r.resolve(QuestionRemoteDataSourceProtocol.self)!,
                         localDataSource: r.resolve(QuestionLocalDataSourceProtocol.self)!
            )
        }
        
        container.register(StatsRepoProtocol.self) { r in
            StatsRepo()
        }
        
        container.register(QuestionRemoteDataSourceProtocol.self) { r in
            QuestionRemoteDataSource(networkProvider: r.resolve(Session.self)!)
        }
        
        container.register(Session.self) { _ in
            return AF
        }
        
        container.register(QuestionLocalDataSourceProtocol.self) { r in
            QuestionLocalDataSource()
        }.inObjectScope(.container)
        
        container.register(CategoryRemoteDataSource.self) { r in
            CategoryRemoteDataSource(networkProvider: r.resolve(Session.self)!)
        }
        
        container.register(CategoryRepoProtocol.self) { r in
            CaregoryRepo(remoteDataSource: r.resolve(CategoryRemoteDataSource.self)!)
        }
    }
    
    
}
