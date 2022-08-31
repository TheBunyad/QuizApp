//
//  Router.swift
//  presentation
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import Swinject
import domain

public protocol RouterProtocol {
    func mainViewController() -> MainViewController
    
}

public class Router: RouterProtocol {
    
    private let resolver: Resolver
    
    public init(resolver: Resolver) {
        self.resolver = resolver 
    }
    
    public func mainViewController() -> MainViewController {
        let vc = MainViewController()
        vc.vm = self.resolver.resolve(MainViewModel.self)!
        vc.router = self
        
        return vc
    }
}
