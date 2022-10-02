//
//  ProfileViewController.swift
//  presentation
//
//  Created by Bunyad Majidzade on 27.09.22.
//

import Foundation
import UIKit
import SnapKit
import Promises

public class ProfileViewController: BaseViewController<ProfileViewModel> {
    
    //MARK: - UI Elements
    
    private lazy var userName_lbl: UILabel = {
        let lbl = UILabel()
        self.view.addSubview(lbl)
        lbl.text = "Game History"
        lbl.textColor = bluePageTitle
        lbl.font = UIFont(font: FontFamily.Poppins.semiBold, size: 20)
        
        return lbl
    }()
    
    private lazy var highestScores_lbl: UILabel = {
        let lbl = UILabel()
        self.view.addSubview(lbl)
        lbl.text = "Highest Scores"
        lbl.textColor = bluePageTitle
        lbl.font = UIFont(font: FontFamily.Poppins.semiBold, size: 20)
        
        return lbl
    }()
    
    private lazy var recordTableCategoryName_lbl: UILabel = {
        let lbl = UILabel()
        self.view.addSubview(lbl)
        lbl.text = "Category: "
        lbl.textColor = black
        lbl.font = UIFont(font: FontFamily.Poppins.regular, size: 16)
        
        return lbl
    }()
    
    private lazy var recordTableScore_lbl: UILabel = {
        let lbl = UILabel()
        self.view.addSubview(lbl)
        lbl.text = "Score"
        lbl.textColor = black
        lbl.font = UIFont(font: FontFamily.Poppins.regular, size: 16)
        
        return lbl
    }()
    
    override init(vm: ProfileViewModel, router: RouterProtocol) {
        super.init(vm: vm, router: router)
        vm.set(delegate: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var gameRecords_tbl: UITableView = {
        let table = UITableView()
        self.view.addSubview(table)
        table.register(GameRecordsTableViewCell.self, forCellReuseIdentifier: "game_record_table")
        table.dataSource = self
        table.delegate = self
        table.isScrollEnabled = false
        
        return table
    }()
    
    private lazy var scoresTableCategoryName_lbl: UILabel = {
        let lbl = UILabel()
        self.view.addSubview(lbl)
        lbl.text = "Category: "
        lbl.textColor = black
        lbl.font = UIFont(font: FontFamily.Poppins.regular, size: 16)
        
        return lbl
    }()
    
    private lazy var scoresTableScore_lbl: UILabel = {
        let lbl = UILabel()
        self.view.addSubview(lbl)
        lbl.text = "Score"
        lbl.textColor = black
        lbl.font = UIFont(font: FontFamily.Poppins.regular, size: 16)
        
        return lbl
    }()
    
    private lazy var highScores_tbl: UITableView = {
        let table = UITableView()
        self.view.addSubview(table)
        table.register(HighScoresTableViewCell.self, forCellReuseIdentifier: "high_scores_table")
        table.dataSource = self
        table.delegate = self
        
        
        return table
    }()
    
    
    //MARK: - View Did Load
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = backgournd
        
        self.userName_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.snp.left).offset(16)
        }
        
        self.recordTableCategoryName_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.userName_lbl.snp.bottom).offset(10)
            make.left.equalTo(self.userName_lbl.snp.left)
        }
        
        self.recordTableScore_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.userName_lbl.snp.bottom).offset(10)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-24)
        }
        
        
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == gameRecords_tbl {
            return vm.getGameRecordsCount()
        }
        else if tableView == highScores_tbl {
            return vm.getMaxScoresCount()
        }
        
         return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == gameRecords_tbl {
            let cell = tableView.dequeueReusableCell(withIdentifier: "game_record_table") as! GameRecordsTableViewCell
            let record = vm.getGameRecord(id: indexPath.row)
            cell.setData(record: record)
            cell.backgroundColor = backgournd
            
            return cell
        } else if tableView == highScores_tbl {
            let cell = tableView.dequeueReusableCell(withIdentifier: "high_scores_table") as! HighScoresTableViewCell
            let score = vm.getMaxScores(id: indexPath.row)
            cell.setData(score: score)
            cell.backgroundColor = backgournd
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

extension ProfileViewController: ProfileViewDelegate {
    public func reloadTableView() {
        self.gameRecords_tbl.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.top.equalTo(self.recordTableCategoryName_lbl.snp.bottom).offset(14)
            make.height.equalTo(50 * vm.getGameRecordsCount())
        }
        self.gameRecords_tbl.reloadData()
    }
    
    public func reloadScoresTableView() {
        
        self.highestScores_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.gameRecords_tbl.snp.bottom).offset(12)
            make.left.equalTo(self.userName_lbl.snp.left)
        }
        
        self.scoresTableCategoryName_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.highestScores_lbl.snp.bottom).offset(10)
            make.left.equalTo(self.recordTableCategoryName_lbl.snp.left)
        }
        
        self.scoresTableScore_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.highestScores_lbl.snp.bottom).offset(10)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-24)
        }
        
        self.highScores_tbl.snp.makeConstraints { make in
            make.top.equalTo(self.scoresTableCategoryName_lbl.snp.bottom).offset(8)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-8)
        }
        
        self.highScores_tbl.reloadData()
    }
}
