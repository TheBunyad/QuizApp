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
    
    
    init(multiplayer: Bool, vm: DifficultyViewModel, router: RouterProtocol) {
        self.multiplayer = multiplayer
        super.init(vm: vm, router: router)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Elements
    
    private lazy var easy_btn: UIButton = {
        let btn = UIButton()
        self.view.addSubview(btn)
        btn.setTitle("Easy", for: .normal)
        btn.backgroundColor = .green
        btn.addTarget(self, action: #selector(sendDifficulty(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var medium_btn: UIButton = {
        let btn = UIButton()
        self.view.addSubview(btn)
        btn.setTitle("Medium", for: .normal)
        btn.backgroundColor = .yellow
        btn.addTarget(self, action: #selector(sendDifficulty(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var hard_btn: UIButton = {
        let btn = UIButton()
        self.view.addSubview(btn)
        btn.setTitle("Hard", for: .normal)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(sendDifficulty(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    //MARK: - View Did Load
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let screenWithdh = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        self.view.backgroundColor = .cyan
        
        self.easy_btn.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top).offset(screenHeight/8)
            make.left.equalTo(self.view.snp.left).offset(screenWithdh/8)
            make.right.equalTo(self.view.snp.right).offset(-screenWithdh/8)
            make.height.equalTo(screenHeight/4)
            make.width.equalTo(screenWithdh/4)
        }
        
        self.medium_btn.snp.makeConstraints { make in
            make.top.equalTo(self.easy_btn.snp.bottom)
            make.left.equalTo(self.easy_btn.snp.left)
            make.right.equalTo(self.easy_btn.snp.right)
            make.height.equalTo(screenHeight/4)
            make.width.equalTo(screenWithdh/4)
        }
        
        self.hard_btn.snp.makeConstraints { make in
            make.top.equalTo(self.medium_btn.snp.bottom)
            make.left.equalTo(self.medium_btn.snp.left)
            make.right.equalTo(self.medium_btn.snp.right)
            make.height.equalTo(screenHeight/4)
            make.width.equalTo(screenWithdh/4)
        }
        
    }
    
    @objc func sendDifficulty(_ sender: UIButton) {
        
        let vc = router.catogoryViewController(difficulty: sender.title(for: .normal)!, multiplayer: false)
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
