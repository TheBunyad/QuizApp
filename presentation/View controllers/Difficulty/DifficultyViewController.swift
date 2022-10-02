//
//  DifficultyViewController.swift
//  presentation
//
//  Created by Bunyad Majidzade on 15.09.22.
//

import Foundation
import UIKit

public class DifficultyViewController: BaseViewController<DifficultyViewModel> {
    
    private var multiplayer: Bool
    let easyBackgorund = UIColor(hex: "#53E17DFF")
    let mediumBackground = UIColor(hex: "#FC9956FF")
    let hardbackground = UIColor(hex: "#DE4040FF")
    
    
    init(multiplayer: Bool, vm: DifficultyViewModel, router: RouterProtocol) {
        self.multiplayer = multiplayer
        super.init(vm: vm, router: router)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Variables
    
    //MARK: - UI Elements
    
    private lazy var pageTitle_lbl: UILabel = {
        let lbl = UILabel()
        self.view.addSubview(lbl)
        lbl.text = "QuizApp"
        lbl.font = UIFont(font: FontFamily.Poppins.semiBold, size: 20)
        lbl.textColor = bluePageTitle
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    private lazy var chooseLevel: UILabel = {
        let lbl = UILabel()
        self.view.addSubview(lbl)
        lbl.text = "Choose Level"
        lbl.textColor = .black
        lbl.font = UIFont(font: FontFamily.Poppins.medium, size: 20)
        
        return lbl
    }()
    
    private lazy var easy_lbl: UILabel = {
        let lbl = UILabel()
        self.easy_ui.addSubview(lbl)
        lbl.text = "Easy"
        lbl.textColor = redButtonTitle
        lbl.font = UIFont(font: FontFamily.Poppins.medium, size: 16)
        
        return lbl
    }()
    
    private lazy var easy_ui: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = easyBackgorund
        view.layer.cornerRadius = 6
        view.clipsToBounds = true

        return view
    }()
    
    private lazy var medium_lbl: UILabel = {
        let lbl = UILabel()
        self.medium_ui.addSubview(lbl)
        lbl.text = "Medium"
        lbl.textColor = redButtonTitle
        lbl.font = UIFont(font: FontFamily.Poppins.medium, size: 16)
        
        return lbl
    }()
    
    private lazy var medium_ui: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = mediumBackground
        view.layer.cornerRadius = 6
        view.clipsToBounds = true

        return view
    }()
    
    private lazy var hard_lbl: UILabel = {
        let lbl = UILabel()
        self.hard_ui.addSubview(lbl)
        lbl.text = "Hard"
        lbl.textColor = redButtonTitle
        lbl.font = UIFont(font: FontFamily.Poppins.medium, size: 16)
        
        return lbl
    }()
    
    private lazy var hard_ui: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = hardbackground
        view.layer.cornerRadius = 6
        view.clipsToBounds = true

        return view
    }()
    
    //MARK: - View Did Load
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = backgournd
        
        self.pageTitle_lbl.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(self.view.snp.top).offset(screenHeight * 0.08)
        }
        
        self.chooseLevel.snp.makeConstraints { make in
            make.left.equalTo(self.easy_ui.snp.left)
            make.top.equalTo(self.pageTitle_lbl.snp.bottom).offset(screenHeight * 0.0925)
        }
        
        self.easy_ui.snp.makeConstraints { make in
            make.bottom.equalTo(self.medium_ui.snp.top).offset(-16)
            make.centerX.equalTo(self.view.snp.centerX)
            make.width.equalTo(screenWidth * 0.91)
            make.height.equalTo(screenHeight * 0.0675)
        }
        
        self.easy_lbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        self.medium_ui.snp.makeConstraints { make in
            make.centerY.equalTo(self.view.snp.centerY).offset(screenHeight * 0.01)
            make.centerX.equalTo(self.view.snp.centerX)
            make.width.equalTo(screenWidth * 0.91)
            make.height.equalTo(screenHeight * 0.0675)
        }
        
        self.medium_lbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        self.hard_ui.snp.makeConstraints { make in
            make.top.equalTo(self.medium_ui.snp.bottom).offset(16)
            make.centerX.equalTo(self.view.snp.centerX)
            make.width.equalTo(screenWidth * 0.91)
            make.height.equalTo(screenHeight * 0.0675)
        }
        
        self.hard_lbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        let easyTapGesture = UITapGestureRecognizer(target: self, action: #selector(sendDifficulty(_:)))
        self.easy_ui.addGestureRecognizer(easyTapGesture)
        
        let mediumTapGesture = UITapGestureRecognizer(target: self, action: #selector(sendDifficulty(_:)))
        self.medium_ui.addGestureRecognizer(mediumTapGesture)
        
        let hardTapGesture = UITapGestureRecognizer(target: self, action: #selector(sendDifficulty(_:)))
        self.hard_ui.addGestureRecognizer(hardTapGesture)
    }
    
    @objc func sendDifficulty(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            
            switch sender.view {
               
            case self.easy_ui:
                
                let vc = router.catogoryViewController(difficulty: "Easy", multiplayer: false)
                navigationController?.pushViewController(vc, animated: true)
            case self.medium_ui:
                let vc = router.catogoryViewController(difficulty: "Medium", multiplayer: false)
                navigationController?.pushViewController(vc, animated: true)
            case self.hard_ui:
                let vc = router.catogoryViewController(difficulty: "Hard", multiplayer: false)
                navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        }
        

    }
    
}
