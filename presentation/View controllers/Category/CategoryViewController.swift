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

    init(difficulty: String, multiplayer: Bool, vm: CategoryViewModel, router: RouterProtocol) {
        
        self.difficulty = difficulty
        self.multiplayer = multiplayer
        super.init(vm: vm, router: router)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var categories = [CategoryEntity]()
    
    private lazy var categoryTable: UITableView = {
        let table = UITableView()
        self.view.addSubview(table)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        table.dataSource = self
        table.delegate = self
        
        return table
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray2
        self.vm.getCategory().then {[weak self] response in
            
            DispatchQueue.main.async {
                self?.categories = response
                self?.categoryTable.reloadData()
            }
            
            
        }
        
//        let vc = self.router.questionsViewController(difficulty: "medium", category: 2, multiplayer: false)
//        self.navigationController?.pushViewController(vc, animated: true)
        
        categoryTable.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(10)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-10)
        }
        
    }
    
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return self.categories.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(UITableViewCell.self)")!
        cell.textLabel?.text = categories[indexPath.row].name
        cell.backgroundColor = .blue
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = categories[indexPath.row]
        let vc = router.questionsViewController(difficulty: "medium", category: item.id, multiplayer: false)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


