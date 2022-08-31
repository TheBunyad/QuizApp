//
//  StatsRepoProtocol.swift
//  domain
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import Promises
import RxSwift

public protocol StatsRepoProtocol {
    func getStats() -> Promise<StatsEntity>
    func observeStats() -> Observable<StatsEntity>
}
