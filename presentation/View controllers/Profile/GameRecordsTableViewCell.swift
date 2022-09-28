//
//  GameRecordsTableViewCell.swift
//  presentation
//
//  Created by Bunyad Majidzade on 27.09.22.
//

import Foundation
import UIKit
import SnapKit
import domain

class GameRecordsTableViewCell: UITableViewCell {
    
    let blueButtonBackground = UIColor(hex: "#6CCDEDff")
    
    private lazy var cellBackground_ui: UIView = {
        let view = UIView()
        self.contentView.addSubview(view)
        view.backgroundColor = blueButtonBackground
        view.clipsToBounds = true
        view.layer.cornerRadius = 6
        
        return view
    }()
    
    private lazy var categoryName_lbl: UILabel = {
        let lbl = UILabel()
        self.cellBackground_ui.addSubview(lbl)
        lbl.font = UIFont(font: FontFamily.Poppins.medium, size: 16)
        
        return lbl
    }()
    
    private lazy var score_lbl: UILabel = {
        let lbl = UILabel()
        self.cellBackground_ui.addSubview(lbl)
        lbl.font = UIFont(font: FontFamily.Poppins.medium, size: 16)
        
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    
    func setupView() {
        self.contentView.layer.cornerRadius = 6
        self.contentView.clipsToBounds = true
        self.contentView.backgroundColor = .white
        
        self.contentView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(60)
        }
        
        self.cellBackground_ui.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(48)
        }
        
        self.categoryName_lbl.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(8)
        }
        
        self.score_lbl.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-8)
        }
        
    }
    
    func setData(record: GameEntity) {
        self.categoryName_lbl.text = record.categoryName
        self.score_lbl.text = String(record.score)
    }
}
