//
//  CategoryRemoteDataSourceProtocol.swift
//  data
//
//  Created by Bunyad Majidzade on 13.09.22.
//

import Foundation
import Promises

protocol CategoryRemoteDataSourceProtocol {
    func fetchCategory() -> Promise<CategoryRemoteDTO>
}
