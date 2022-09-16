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
    
    func fetchQuestions(category: Int) -> Promise<QuestionRemoteDTO> {
        let promise = Promise<QuestionRemoteDTO>.pending()
        
        self.networkProvider.request("https://opentdb.com/api.php?amount=10&category=\(category)&type=multiple")
            .responseDecodable(of: QuestionRemoteDTO.self) { response in
                if let err = response.error {
                    promise.reject(err)
                    print("error RemoteDataSource")
                    return
                }
                
                if let data = response.value {
                    promise.fulfill(data)
                } else {
                    promise.reject(ParsingError())
                    print("Parsing error RemoteDataSource")
                }
                
            }
            
        
        return promise
    }
    
    
}

class ParsingError: Error{
    
}
