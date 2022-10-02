//
//  CategoryRemoteDataSource.swift
//  data
//
//  Created by Bunyad Majidzade on 13.09.22.
//

import Foundation
import Promises
import Alamofire

class CategoryRemoteDataSource: CategoryRemoteDataSourceProtocol {
    
    private let networkProvider: Session
    
    init(networkProvider: Session) {
        self.networkProvider = networkProvider
    }
    
    func fetchCategory() -> Promise<CategoryRemoteDTO> {
        let promise = Promise<CategoryRemoteDTO>.pending()
        
        self.networkProvider.request("https://opentdb.com/api_category.php")
            .responseDecodable(of: CategoryRemoteDTO.self) { response in
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

