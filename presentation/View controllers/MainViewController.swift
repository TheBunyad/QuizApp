//
//  MainController.swift
//  presentation
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import UIKit
import SnapKit
import SwiftUI

public class MainViewController: BaseViewController<MainViewModel> {
    
    
    
    private lazy var quizApp_lbl: UILabel = {
        let view = UILabel()
        self.view.addSubview(view)
        view.font = UIFont(name: FontFamily.Poppins.bold.name, size: 32)
        view.textColor = .cyan
        view.text = L10n.appTitleName
        
        return view
    }()
    
    private lazy var image_lbl: UIImageView = {
        let view = UIImageView()
        self.view.addSubview(view)
        view.image = Asset.vector6.image
        return view
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.887, green: 0.523, blue: 0.473, alpha: 1)
        
        vm?.getUser()?.then({ user in            
            print(user.self)
        })
        
        vm?.getQuestion()?.then({ question in
            print(question.self)
        })
        
        self.quizApp_lbl.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.snp.centerY).offset(-140)
            make.centerX.equalTo(self.view.snp.centerX)
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
