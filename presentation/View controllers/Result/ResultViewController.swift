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
    
    private var score: Int
    
    init(score: Int, vm: ResultViewModel, router: RouterProtocol) {
        self.score = score
        super.init(vm: vm, router: router)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Elements
    
    private lazy var score_lbl: UILabel = {
        let lbl = UILabel()
        self.view.addSubview(lbl)
        lbl.text = "\(String(self.score)) / 10"
        lbl.font = UIFont(name: FontFamily.Poppins.bold.name, size: 56)
        lbl.textAlignment = .center
        lbl.textColor = .systemBlue
        
        return lbl
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray3
        
        self.score_lbl.snp.makeConstraints { make in
            make.center.equalTo(self.view.snp.center)
        }
    }
    
    
}
