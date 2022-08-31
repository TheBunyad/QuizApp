//
//  UserEntity.swift
//  domain
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation

public struct UserEntity {
    public let userName: String
    public let email: String
    public let password: String
    
    public init (
        userName: String,
        email: String,
        password: String
    ) {
        self.userName = userName
        self.email = email
        self.password = password
    }
}
