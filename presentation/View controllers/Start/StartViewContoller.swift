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
    
    private lazy var singlePlayer_btn: UIButton = {
        let btn = UIButton()
        self.view.addSubview(btn)
        btn.setTitle("Single Player", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.addTarget(self, action: #selector(singlePlayer(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var multiPlayer_btn: UIButton = {
        let btn = UIButton()
        self.view.addSubview(btn)
        btn.setTitle("PvP", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.addTarget(self, action: #selector(pvp(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    //MARK: - View Did Load
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray
        
        self.singlePlayer_btn.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.snp.centerY).offset(-16)
            make.centerX.equalTo(self.view.snp.centerX)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        self.multiPlayer_btn.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.centerY).offset(16)
            make.centerX.equalTo(self.view.snp.centerX)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }
    
    @objc func singlePlayer(_ sender: UIButton) {
        print("next page")
        let vc = router.difficultyViewController(multiplayer: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func pvp(_ sender: UIButton) {
        
    }
}
