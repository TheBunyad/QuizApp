//
//  BaseViewController.swift
//  presentation
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import Foundation
import UIKit

public class BaseViewController<VM>: UIViewController {
    
    var vm: VM? = nil
    var router: RouterProtocol? = nil
}
