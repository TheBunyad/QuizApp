//
//  CategoryRepoProtocol.swift
//  domain
//
//  Created by Bunyad Majidzade on 13.09.22.
//

import Foundation
import Promises

public protocol CategoryRepoProtocol {
    func getCategory() -> Promise<[CategoryEntity]>
}
