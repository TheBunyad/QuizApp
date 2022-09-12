//
//  MainController.swift
//  presentation
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import UIKit
import SnapKit
import SwiftUI
import domain
import RxSwift

public class MainViewController: BaseViewController<MainViewModel> {
    
    //MARK: - Variables
    
    private var blue = UIColor(red: 0.208, green: 0.339, blue: 0.675, alpha: 1)
    private var white = UIColor.white
    
    //MARK: - UI Elements
    private lazy var quizApp_lbl: UILabel = {
        let view = UILabel()
        self.view.addSubview(view)
        view.font = UIFont(name: FontFamily.Poppins.bold.name, size: 32)
        view.textColor = .cyan
        view.text = L10n.appTitleName
        
        return view
    }()
    
    private lazy var question_lbl: UILabel = {
        let view = UILabel()
        self.view.addSubview(view)
        view.font = UIFont(name: FontFamily.Poppins.medium.name, size: 24)
        view.textColor = .black
        view.numberOfLines = 0
        
        return view
    }()
    
    private lazy var answer1_ui: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = self.blue
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var answer1_lbl: UILabel = {
        let view = UILabel()
        self.answer1_ui.addSubview(view)
        view.font = UIFont(name: FontFamily.Poppins.medium.name, size: 20)
        view.textColor = .black
        
        return view
    }()
    
    private lazy var answer2_ui: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = self.blue
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var answer2_lbl: UILabel = {
        let view = UILabel()
        self.answer2_ui.addSubview(view)
        view.font = UIFont(name: FontFamily.Poppins.medium.name, size: 20)
        view.textColor = .black
        
        return view
    }()
    
    private lazy var answer3_ui: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = self.blue
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var answer3_lbl: UILabel = {
        let view = UILabel()
        self.answer3_ui.addSubview(view)
        view.font = UIFont(name: FontFamily.Poppins.medium.name, size: 20)
        view.textColor = .black
        
        
        return view
    }()
    
    private lazy var answer4_ui: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = self.blue
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var answer4_lbl: UILabel = {
        let view = UILabel()
        self.answer4_ui.addSubview(view)
        view.font = UIFont(name: FontFamily.Poppins.medium.name, size: 20)
        view.textColor = .black
        
        return view
    }()
    
    private lazy var next_btn: UIButton = {
        let button = UIButton()
        self.view.addSubview(button)
        button.backgroundColor = self.blue
        button.setTitle("Next", for: .normal)
        button.setTitleColor(self.white, for: .normal)
        button.addTarget(self, action: #selector(next(_:)), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - ViewDidLoad
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.887, green: 0.523, blue: 0.473, alpha: 1)
        
        self.quizApp_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            make.centerX.equalTo(self.view.snp.centerX)
            
        }
        
        self.question_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.quizApp_lbl.snp.bottom).offset(40)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
        }
        
        self.answer1_ui.snp.makeConstraints { make in
            make.bottom.equalTo(self.answer2_ui.snp.top).offset(-24)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.height.equalTo(50)
        }
        
        self.answer1_lbl.snp.makeConstraints { make in
            make.center.equalTo(self.answer1_ui.snp.center)
        }
        
        self.answer2_ui.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.snp.centerY).offset(48)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.height.equalTo(50)
        }
        
        self.answer2_lbl.snp.makeConstraints { make in
            make.center.equalTo(self.answer2_ui.snp.center)
        }
        
        self.answer3_ui.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.centerY).offset(72)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.height.equalTo(50)
        }
        
        self.answer3_lbl.snp.makeConstraints { make in
            make.center.equalTo(self.answer3_ui.snp.center)
        }
        
        self.answer4_ui.snp.makeConstraints { make in
            make.top.equalTo(self.answer3_ui.snp.bottom).offset(24)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.height.equalTo(50)
        }
        
        self.answer4_lbl.snp.makeConstraints { make in
            make.center.equalTo(self.answer4_ui.snp.center)
        }
        
        self.next_btn.snp.makeConstraints { make in
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-24)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
    }
    //MARK: - ViewDidAppear
    
    public override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
    }
    
    //MARK: - ViewWillAppear
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.vm?.syncQuestion()
        self.vm?.nextQuestion()
        let subscriber = self.vm?.observeQuestion()
            .subscribe(
                onNext: { next in
                    guard let data = next else { return }
                    self.question_lbl.text = data.question
                    self.answer1_lbl.text = data.correctAnswer
                    self.answer2_lbl.text = data.incorrectAnswers[0]
                    self.answer3_lbl.text = data.incorrectAnswers[1]
                    self.answer4_lbl.text = data.incorrectAnswers[2]
                }, onError: { err in
                    print(err)
                }, onCompleted: {
                    self.next_btn.setTitle("Completed", for: .normal)
                    
                })
        
        vm?.dispose(of: subscriber)
    }
    
    //MARK: ViewWillDisappear
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //MARK: - Functions
    
    @objc func next(_ sender: UIButton?) {
        if self.next_btn.titleLabel?.text == "Next" {
            self.vm?.nextQuestion()
        }
        if self.next_btn.titleLabel?.text == "Completed" {
            self.question_lbl.text = "Completed"
        }
        
    }
    
    @objc func result(_ sender: UIButton?) {
        
    }
}
