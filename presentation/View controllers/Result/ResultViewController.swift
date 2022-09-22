//
//  ResultViewController.swift
//  presentation
//
//  Created by Bunyad Majidzade on 16.09.22.
//

import UIKit
import SnapKit
import SwiftUI
import domain
import RxSwift

public class ResultViewController: BaseViewController<ResultViewModel> {
    
    //MARK: - UI Elements
    
    private lazy var score_lbl: UILabel = {
        let lbl = UILabel()
        self.view.addSubview(lbl)
        lbl.text = "\(String(vm.getScore())) / 10"
        lbl.font = UIFont(name: FontFamily.Poppins.semiBold.name, size: 56)
        lbl.textAlignment = .center
        lbl.textColor = blueButtonBackground
        
        return lbl
    }()
    
    private lazy var playAgain_ui: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = blueButtonBackground
        view.clipsToBounds = true
        view.layer.cornerRadius = 6
        
        return view
    }()
    
    private lazy var playAgain_lbl: UILabel = {
        let lbl = UILabel()
        self.playAgain_ui.addSubview(lbl)
        lbl.text = "Play Again"
        lbl.font = UIFont(font: FontFamily.Poppins.regular, size: 16)
        lbl.textColor = black
        
        return lbl
    }()
    
    private lazy var mainMenu_ui: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = blueButtonBackground
        view.clipsToBounds = true
        view.layer.cornerRadius = 6
        
        return view
    }()
    
    private lazy var mainMenu_lbl: UILabel = {
        let lbl = UILabel()
        self.mainMenu_ui.addSubview(lbl)
        lbl.text = "Main Menu"
        lbl.font = UIFont(font: FontFamily.Poppins.regular, size: 16)
        lbl.textColor = black
        
        return lbl
    }()
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isUserInteractionEnabled = false
        self.view.backgroundColor = .white
        
        self.score_lbl.snp.makeConstraints { make in
            make.centerY.equalTo(self.view.snp.centerY).offset(-(screenHeight * 0.1))
            make.centerX.equalToSuperview()
        }
        
        self.mainMenu_ui.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.centerX.equalTo(self.view.snp.centerX)
            make.width.equalTo(screenWidth * 0.91)
            make.height.equalTo(screenHeight * 0.0675)
        }
        
        self.mainMenu_lbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        self.playAgain_ui.snp.makeConstraints { make in
            make.bottom.equalTo(self.mainMenu_ui.snp.top).offset(-16)
            make.centerX.equalTo(self.view.snp.centerX)
            make.width.equalTo(screenWidth * 0.91)
            make.height.equalTo(screenHeight * 0.0675)
        }
        
        self.playAgain_lbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        let playAgainTapGesture = UITapGestureRecognizer(target: self, action: #selector(playAgain(_:)))
        self.playAgain_ui.addGestureRecognizer(playAgainTapGesture)
        
        let mainMenuTapGesture = UITapGestureRecognizer(target: self, action: #selector(mainMenu(_:)))
        self.mainMenu_ui.addGestureRecognizer(mainMenuTapGesture)
    }
    
    @objc func playAgain(_ sender: UITapGestureRecognizer) {
        let vc = router.questionsViewController(difficulty: vm.getDifficulty(), category: vm.getCategory(), multiplayer: false)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func mainMenu(_ sender: UITapGestureRecognizer) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
