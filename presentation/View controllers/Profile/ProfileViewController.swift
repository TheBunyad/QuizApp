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
        lbl.text = "Username: "
        lbl.textColor = bluePageTitle
        lbl.font = UIFont(font: FontFamily.Poppins.semiBold, size: 24)
        
        return lbl
    }()
    
    private lazy var gameRecords_table: UITableView = {
        let table = UITableView()
        self.view.addSubview(table)
        table.register(GameRecordsTableViewCell.self, forCellReuseIdentifier: "game_record_table")
        table.delegate = self
        table.dataSource = self
        
        return table
    }()
    
    //MARK: - View Did Load
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgournd
//        vm.mockData()
//        print("count: \(vm.getGameRecordsCount())")
        
        self.userName_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(screenHeight * 0.02)
            make.left.equalTo(self.view.snp.left).offset(16)
        }
        
        self.gameRecords_table.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.top.equalTo(self.userName_lbl.snp.bottom).offset(screenWidth * 0.03)
            make.height.equalTo(60 )
        }
        
    }
    
    //MARK: - View Did Appear
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "game_record_table") as! GameRecordsTableViewCell
        let record = vm.getGameRecord(id: indexPath.row)
        cell.setData(record: record)
        
        return cell
    }
    
    
}
