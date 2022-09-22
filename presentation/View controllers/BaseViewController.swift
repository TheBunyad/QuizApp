//
//  BaseViewController.swift
//  presentation
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import UIKit

public class BaseViewController<VM>: UIViewController {
    
    var backgournd = UIColor.white
    let bluePageTitle = UIColor(hex: "#16537eff")
    let blueButtonBackground = UIColor(hex: "#6CCDEDff")
    let redButtonTitle = UIColor(hex: "#000000ff")
    let orange = UIColor(hex: "#FC9956FF")
    let green = UIColor(hex: "#1F9C44FF")
    let red = UIColor(hex: "#C82B2BFF")
    let black = UIColor(hex: "#101010FF")
    
    var vm: VM
    var router: RouterProtocol
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    init(vm: VM, router: RouterProtocol) {
        self.vm = vm
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    
}
