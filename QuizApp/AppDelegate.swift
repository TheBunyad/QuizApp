//
//  AppDelegate.swift
//  QuizApp
//
//  Created by Bunyad Majidzade on 27.08.22.
//

import UIKit
import presentation
import Swinject
import data
import domain

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let assembler = Assembler([
            DomainAssembly(),
            DataAssembly(),
            PresentetionAssebly()
        ])
        
        let router: RouterProtocol = Router(resolver: assembler.resolver)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let vc = router.mainViewController()
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    
    
    
}

