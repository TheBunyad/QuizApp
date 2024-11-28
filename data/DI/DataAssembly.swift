//
//  DataAssembly.swift
//  data
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import Swinject
import domain
import Realm
import RealmSwift
import Alamofire

public class DataAssembly: Assembly {
    
    public init() {
        
    }
    
    public func assemble(container: Container) {
        container.register(UserRepoProtocol.self) { r in
            UserRepo()
        }
        
        container.register(Realm.self) { r in
            try! Realm(configuration: Realm.Configuration(schemaVersion: 1, deleteRealmIfMigrationNeeded: true))
        }.inObjectScope(.container)
        
        container.register(QuestionRepoProtocol.self) { r in
            QuestionRepo(remoteDataSource: r.resolve(QuestionRemoteDataSourceProtocol.self)!
            )
        }
        
        container.register(QuestionRemoteDataSourceProtocol.self) { r in
            QuestionRemoteDataSource(networkProvider: r.resolve(Session.self)!)
        }
        
        container.register(Session.self) { _ in
            return AF
        }
        
//        container.register(QuestionLocalDataSourceProtocol.self) { r in
//            QuestionLocalDataSource(realm: r.resolve(Realm.self)!)
//        }.inObjectScope(.container)
        
        container.register(GameRecordLocalDataSourceProtocol.self) { r in
            GameRecordLocalDataSource(realm: r.resolve(Realm.self)!)
        }.inObjectScope(.container)
        
        container.register(CategoryRemoteDataSource.self) { r in
            CategoryRemoteDataSource(networkProvider: r.resolve(Session.self)!)
        }
        
        container.register(CategoryRepoProtocol.self) { r in
            CaregoryRepo(remoteDataSource: r.resolve(CategoryRemoteDataSource.self)!)
        }
        
        container.register(ProfileRepoProtocol.self) { r in
            ProfileRepo(loaclDataSource: r.resolve(GameRecordLocalDataSourceProtocol.self)!)
        }
    }
    
    
}
