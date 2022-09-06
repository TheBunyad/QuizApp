//
//  QuestionRemoteDataSource.swift
//  data
//
//  Created by Bunyad Majidzade on 03.09.22.
//

import Alamofire
import Foundation
import Promises

class QuestionRemoteDataSource: QuestionRemoteDataSourceProtocol {
    
    private let networkProvider: Session
    
    init(networkProvider: Session) {
        self.networkProvider = networkProvider
    }
    
    func fetchQuestions() -> Promise<QuestionRemoteDTO> {
        let promise = Promise<QuestionRemoteDTO>.pending()
        
        self.networkProvider.request("https://opentdb.com/api.php?amount=10")
            .responseDecodable(of: QuestionRemoteDTO.self) { response in
                if let err = response.error {
                    promise.reject(err)
                    return
                }
                
                if let data = response.value {
                    promise.fulfill(data)
                } else {
                    promise.reject(ParsingError())
                }
                
            }
            
        
        return promise
    }
    
    
}

class ParsingError: Error{
    
}
