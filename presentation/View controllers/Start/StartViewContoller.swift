//
//  StartViewController.swift
//  presentation
//
//  Created by Bunyad Majidzade on 15.09.22.
//

import Foundation
import UIKit
import SnapKit

public class StartViewController: BaseViewController<StartViewModel> {
    
    override init(vm: StartViewModel, router: RouterProtocol) {
        super.init(vm: vm, router: router)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Variables
    
    
    
    //MARK: - UI Components
    
    private lazy var pageTitle_lbl: UILabel = {
        let lbl = UILabel()
        self.view.addSubview(lbl)
        lbl.text = "QuizApp"
        lbl.font = UIFont(font: FontFamily.Poppins.semiBold, size: 20)
        lbl.textColor = bluePageTitle
        lbl.textAlignment = .center
        
        return lbl
    }()

    
    private lazy var singlePlayer_lbl: UILabel = {
        let lbl = UILabel()
        self.singlePlayer_ui.addSubview(lbl)
        lbl.text = "Single Player"
        lbl.textColor = redButtonTitle
        lbl.font = UIFont(font: FontFamily.Poppins.medium, size: 16)
        
        return lbl
    }()
    
    private lazy var singlePlayer_ui: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = blueButtonBackground
        view.layer.cornerRadius = 6
        view.clipsToBounds = true

        return view
    }()
    
    private lazy var PvP_lbl: UILabel = {
        let lbl = UILabel()
        self.PvP_ui.addSubview(lbl)
        lbl.text = "PvP"
        lbl.textColor = redButtonTitle
        lbl.font = UIFont(font: FontFamily.Poppins.medium, size: 16)
        
        return lbl
    }()
    
    private lazy var PvP_ui: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = blueButtonBackground
        view.layer.cornerRadius = 6
        view.clipsToBounds = true

        return view
    }()
    
    private lazy var profile_lbl: UILabel = {
        let lbl = UILabel()
        self.profile_ui.addSubview(lbl)
        lbl.text = "Profile"
        lbl.textColor = redButtonTitle
        lbl.font = UIFont(font: FontFamily.Poppins.medium, size: 16)
        
        return lbl
    }()
    
    private lazy var profile_ui: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = blueButtonBackground
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
        
        self.singlePlayer_ui.snp.makeConstraints { make in
            make.bottom.equalTo(self.PvP_ui.snp.top).offset(-16)
            make.centerX.equalTo(self.view.snp.centerX)
            make.width.equalTo(screenWidth * 0.91)
            make.height.equalTo(screenHeight * 0.0675)
        }
        
        self.singlePlayer_lbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        self.PvP_ui.snp.makeConstraints { make in
            make.centerY.equalTo(self.view.snp.centerY).offset(screenHeight * 0.01)
            make.centerX.equalTo(self.view.snp.centerX)
            make.width.equalTo(screenWidth * 0.91)
            make.height.equalTo(screenHeight * 0.0675)
        }
        
        self.PvP_lbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        self.profile_ui.snp.makeConstraints { make in
            make.top.equalTo(self.PvP_ui.snp.bottom).offset(16)
            make.centerX.equalTo(self.view.snp.centerX)
            make.width.equalTo(screenWidth * 0.91)
            make.height.equalTo(screenHeight * 0.0675)
        }
        
        self.profile_lbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        let singlePlayerTabGesture = UITapGestureRecognizer(target: self, action: #selector(singlePlayer(_:)))
        self.singlePlayer_ui.addGestureRecognizer(singlePlayerTabGesture)
    }
    
    @objc func singlePlayer(_ sender: UITapGestureRecognizer) {
    
        let vc = router.difficultyViewController(multiplayer: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
//
//    @objc func pvp(_ sender: UIButton) {
//
//    }
}
