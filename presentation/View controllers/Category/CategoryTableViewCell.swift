//
//  CategoryTableViewCell.swift
//  presentation
//
//  Created by Bunyad Majidzade on 21.09.22.
//

import Foundation
import UIKit
import SnapKit

class CategoryTableViewCell: UITableViewCell {
    
    let blueButtonBackground = UIColor(hex: "#6CCDEDff")
    
    private lazy var category_ui: UIView = {
        let view = UIView()
        self.contentView.addSubview(view)
        view.backgroundColor = blueButtonBackground
        view.clipsToBounds = true
        view.layer.cornerRadius = 6
        
        return view
    }()
    
    private lazy var category_lbl: UILabel = {
        let lbl = UILabel()
        self.category_ui.addSubview(lbl)
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
        self.contentView.backgroundColor = backgroundColor
        
        self.contentView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(60)
        }
        
        self.category_ui.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(48)
        }
        
        self.category_lbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func setData(category: String) {
        self.category_lbl.text = category
    }

}
