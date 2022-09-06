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

public class MainViewController: BaseViewController<MainViewModel> {
    
    private var questions: [Result] = []
    
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
        
        return view
    }()
    
    private lazy var answer1_lbl: UILabel = {
        let view = UILabel()
        self.view.addSubview(view)
        view.font = UIFont(name: FontFamily.Poppins.medium.name, size: 20)
        view.textColor = .black
        
        return view
    }()
    
    private lazy var answer2_lbl: UILabel = {
        let view = UILabel()
        self.view.addSubview(view)
        view.font = UIFont(name: FontFamily.Poppins.medium.name, size: 20)
        view.textColor = .black
        
        return view
    }()
    
    private lazy var answer3_lbl: UILabel = {
        let view = UILabel()
        self.view.addSubview(view)
        view.font = UIFont(name: FontFamily.Poppins.medium.name, size: 20)
        view.textColor = .black
        
        return view
    }()
    
    private lazy var answer4_lbl: UILabel = {
        let view = UILabel()
        self.view.addSubview(view)
        view.font = UIFont(name: FontFamily.Poppins.medium.name, size: 20)
        view.textColor = .black
        
        return view
    }()
    
        
    private lazy var image_lbl: UIImageView = {
        let view = UIImageView()
        self.view.addSubview(view)
        view.image = Asset.vector6.image
        return view
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = UIColor(red: 0.887, green: 0.523, blue: 0.473, alpha: 1)
        
        vm?.getUser()?.then({ user in            
            print(user.self)
        })
        
        vm?.getQuestion()?.then({ question in
            self.questions = question.results
            print(question)
        })
        
        self.quizApp_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        changeQuestion(questionNumber: 0)
        print(self.question_lbl.text)
        
        self.question_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.quizApp_lbl.snp.bottom).offset(40)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
        }
        
        self.answer1_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.question_lbl.snp.bottom).offset(24)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
        }
        
        self.answer2_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.answer1_lbl.snp.bottom).offset(24)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
        }
        
        self.answer3_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.answer2_lbl.snp.bottom).offset(24)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
        }
        
        self.answer4_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.answer3_lbl.snp.bottom).offset(24)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
        }
    }
    
    
    func changeQuestion(questionNumber: Int) {
        self.question_lbl.text = self.questions[questionNumber].question
        print("question: \(self.questions[questionNumber].question)")
        self.answer1_lbl.text = self.questions[questionNumber].correctAnswer
        self.answer2_lbl.text = self.questions[questionNumber].incorrectAnswers[0]
        self.answer3_lbl.text = self.questions[questionNumber].incorrectAnswers[1]
        self.answer4_lbl.text = self.questions[questionNumber].incorrectAnswers[2]
    }
    
}
