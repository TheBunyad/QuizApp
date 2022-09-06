//
//  QuestionRepo.swift
//  data
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import domain
import RxSwift
import Promises

public class QuestionRepo: QuestionRepoProtocol {
    
    private let localDataSource: QuestionLocalDataSourceProtocol
    private let remoteDataSource: QuestionRemoteDataSourceProtocol
    
    init(remoteDataSource: QuestionRemoteDataSourceProtocol,
         localDataSource: QuestionLocalDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    public func getQuestion() -> Promise<QuestionEntity> {
        self.remoteDataSource.fetchQuestions()
            .then { dto in
                dto.toDomain()
            }
    }
    
    public func observerQuestion() -> Observable<QuestionEntity> {
       
        
        // return observed datassc
        
        return localDataSource.observeQuestion().map { dto in
                dto.toDomain()
            }
    }
    
    
    
}
