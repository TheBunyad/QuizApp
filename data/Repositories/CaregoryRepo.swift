//
//  CaregoryRepo.swift
//  data
//
//  Created by Bunyad Majidzade on 13.09.22.
//

import Foundation
import domain
import RxSwift
import Promises

public class CaregoryRepo: CategoryRepoProtocol {
    private let remoteDataSource: CategoryRemoteDataSourceProtocol
    
    init(remoteDataSource: CategoryRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    public func getCategory() -> Promise<[CategoryEntity]> {
        let promise: Promise<[CategoryEntity]> = .pending()
        self.remoteDataSource.fetchCategory()
            .then { remoteDTO in
                promise.fulfill(remoteDTO.toDomain())
            }.catch { error in
                promise.reject(error)
            }
        
        return promise
    }
    
    
}
