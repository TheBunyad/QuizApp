//
//  CategoryViewController.swift
//  presentation
//
//  Created by Bunyad Majidzade on 13.09.22.
//

import UIKit
import SnapKit
import SwiftUI
import domain
import RxSwift

public class CategoryViewController: BaseViewController<CategoryViewModel> {
    
    private var difficulty: String
    private var multiplayer: Bool
    private var categories = [CategoryEntity]()

    init(difficulty: String, multiplayer: Bool, vm: CategoryViewModel, router: RouterProtocol) {
        
        self.difficulty = difficulty
        self.multiplayer = multiplayer
        super.init(vm: vm, router: router)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var pageTitle_lbl: UILabel = {
        let lbl = UILabel()
        self.view.addSubview(lbl)
        lbl.text = "QuizApp"
        lbl.font = UIFont(font: FontFamily.Poppins.semiBold, size: 20)
        lbl.textColor = bluePageTitle
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    private lazy var chooseCategory_lbl: UILabel = {
        let lbl = UILabel()
        self.view.addSubview(lbl)
        lbl.text = "Choose Category"
        lbl.font = UIFont(font: FontFamily.Poppins.medium, size: 20)
        lbl.textColor = .black
        
        return lbl
    }()
    
    private lazy var categoryTable: UITableView = {
        let table = UITableView()
        self.view.addSubview(table)
        table.register(CategoryTableViewCell.self, forCellReuseIdentifier: "category_cell")
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.backgroundColor = backgournd
        
        return table
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = backgournd
        self.vm.getCategory().then {[weak self] response in
            self?.categories.append(CategoryEntity(id: 0, name: "Any Category"))
            DispatchQueue.main.async {
                self?.categories.append(contentsOf: response)
                self?.categoryTable.reloadData()
            }
        }
        
        self.pageTitle_lbl.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(self.view.snp.top).offset(screenHeight * 0.08)
        }
        
        self.chooseCategory_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.pageTitle_lbl.snp.bottom).offset(screenHeight * 0.0625)
            make.left.equalTo(self.categoryTable.snp.left)
        }
        
        self.categoryTable.snp.makeConstraints { make in
            make.top.equalTo(self.chooseCategory_lbl.snp.bottom).offset(24)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(screenWidth * 0.045)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-(screenWidth * 0.045))
        }
        
    }
    
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return self.categories.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "category_cell") as! CategoryTableViewCell
        let name = categories[indexPath.row].name
        cell.backgroundColor = backgournd
        cell.setData(category: name)
    
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = categories[indexPath.row]
        if item.id == 0 {
            let vc = router.questionsViewController(difficulty: self.vm.getDiffiluty(difficulty: difficulty), category: "", multiplayer: false)
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = router.questionsViewController(difficulty: self.vm.getDiffiluty(difficulty: difficulty), category: "&category=\(item.id)", multiplayer: false)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}


