//
//  UserRepoProtocol.swift
//  domain
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import Promises
import RxSwift

public protocol UserRepoProtocol {
    func getUser() -> Promise<UserEntity>
    func observeUSer() -> Observable<UserEntity>
    func syncQuestion() -> Promise<Void>
}
