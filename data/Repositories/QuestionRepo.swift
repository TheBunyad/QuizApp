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
    
    public func getQuestion() -> Promise<[QuestionEntity]> {
        let promise: Promise<[QuestionEntity]> = .pending()
        self.remoteDataSource.fetchQuestions()
            .then { remoteDTOs in
                promise.fulfill(remoteDTOs.toDomain())
            }.catch { error in
                promise.reject(error)
            }
        
        return promise
    }
    
    public func observerQuestion() -> Observable<[QuestionEntity]> {
        self.localDataSource.observeQuestions()
            .map { localDTOs in
                localDTOs.map { $0.toDomain() }
            }
    }
    
    public func syncQuestion() -> Promise<Void> {
        let promise = Promise<Void>.pending()
        self.remoteDataSource.fetchQuestions()
            .then { dto -> Promise<Void> in
                let local = dto.toLocal()
                return self.localDataSource.save(questionDTO: local)
            }
            .then { void in
                promise.fulfill(void)
            }
            .catch { err in
                promise.reject(err)
            }
        
        return promise
    }
    
    
    
}
