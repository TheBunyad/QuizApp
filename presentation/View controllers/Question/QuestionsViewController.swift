//
//  QuestionsViewController.swift
//  presentation
//
//  Created by Bunyad Majidzade on 29.08.22.
//

import UIKit
import SnapKit
import SwiftUI
import domain
import RxSwift

public class QuestionsViewController: BaseViewController<QuestionsViewModel> {
    
    //MARK: - Variables
    
    private var blue = UIColor(red: 0.208, green: 0.339, blue: 0.675, alpha: 1)
    private var white = UIColor.white
    
    private var subscription: Disposable? = nil
    private let disposeBag: DisposeBag = DisposeBag()
    
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
    
    private lazy var timer_lbl: UILabel = {
        let lbl = UILabel()
        self.view.addSubview(lbl)
        lbl.font = UIFont(name: FontFamily.Poppins.medium.name, size: 24)
        lbl.textColor = .blue
        
        return lbl
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
        
        self.timer_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
        }
        
        let chooseAnswer1 = UITapGestureRecognizer(target: self, action: #selector(chooseAnswer(_:)))
        self.answer1_ui.addGestureRecognizer(chooseAnswer1)
        
        let chooseAnswer2 = UITapGestureRecognizer(target: self, action: #selector(chooseAnswer(_:)))
        self.answer2_ui.addGestureRecognizer(chooseAnswer2)
        
        let chooseAnswer3 = UITapGestureRecognizer(target: self, action: #selector(chooseAnswer(_:)))
        self.answer3_ui.addGestureRecognizer(chooseAnswer3)
        
        let chooseAnswer4 = UITapGestureRecognizer(target: self, action: #selector(chooseAnswer(_:)))
        self.answer4_ui.addGestureRecognizer(chooseAnswer4)
        
    }
    //MARK: - ViewDidAppear
    
    public override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
    }
    
    //MARK: - ViewWillAppear
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.subscription = self.vm.observeGameState()
            .subscribe({ received in
                guard let state = received.element else { return }
                
                self.handle(state)
            })
        
        self.subscription?.disposed(by: self.disposeBag)
    }
    
    //MARK: ViewWillDisappear
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    //MARK: - Functions
    
    func handle(_ state: GameState) {
        switch state {
        case .pending:
            break
        case .inProgress(let question, let state):
            
            if self.vm.isLastQuestion() {
                self.next_btn.setTitle("Completed", for: .normal)
            } else {
                self.setup(question: question)
            }
            
            switch state {
            case .pending(let remainingSec):
                self.timer_lbl.text = String(remainingSec)
            case .wrong(let option):
                if self.answer1_lbl.text == option {
                    self.answer1_ui.backgroundColor = .systemRed
                } else if answer2_lbl.text == option {
                    self.answer2_ui.backgroundColor = .systemRed
                } else if answer3_lbl.text == option {
                    self.answer3_ui.backgroundColor = .systemRed
                } else if answer4_lbl.text == option {
                    self.answer4_ui.backgroundColor = .systemRed
                }
                
                if self.answer1_lbl.text == question.correctAnswer {
                    self.answer1_ui.backgroundColor = .systemGreen
                } else if answer2_lbl.text == question.correctAnswer {
                    self.answer2_ui.backgroundColor = .systemGreen
                } else if answer3_lbl.text == question.correctAnswer {
                    self.answer3_ui.backgroundColor = .systemGreen
                } else if answer4_lbl.text == question.correctAnswer {
                    self.answer4_ui.backgroundColor = .systemGreen
                }
                
            case .correct:
                if self.answer1_lbl.text == question.correctAnswer {
                    self.answer1_ui.backgroundColor = .systemGreen
                } else if answer2_lbl.text == question.correctAnswer {
                    self.answer2_ui.backgroundColor = .systemGreen
                } else if answer3_lbl.text == question.correctAnswer {
                    self.answer3_ui.backgroundColor = .systemGreen
                } else if answer4_lbl.text == question.correctAnswer {
                    self.answer4_ui.backgroundColor = .systemGreen
                }
            case .timeout:
                if self.answer1_lbl.text == question.correctAnswer {
                    self.answer1_ui.backgroundColor = .systemYellow
                } else if answer2_lbl.text == question.correctAnswer {
                    self.answer2_ui.backgroundColor = .systemYellow
                } else if answer3_lbl.text == question.correctAnswer {
                    self.answer3_ui.backgroundColor = .systemYellow
                } else if answer4_lbl.text == question.correctAnswer {
                    self.answer4_ui.backgroundColor = .systemYellow
                }
            }
        case .completed:
            let vc = self.router.resultViewController(score: self.vm.correctAnswerCount)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func setup(question: QuestionEntity) {
        self.question_lbl.text = question.question
        var list: [String] = [
            question.correctAnswer,
            question.incorrectAnswers[0],
            question.incorrectAnswers[1],
            question.incorrectAnswers[2]
        ]
        
        var temp = list.randomElement()
        list.remove(at: list.firstIndex(of: temp!)!)
        self.answer1_lbl.text = temp
        
        temp = list.randomElement()
        list.remove(at: list.firstIndex(of: temp!)!)
        self.answer2_lbl.text = temp
        
        temp = list.randomElement()
        list.remove(at: list.firstIndex(of: temp!)!)
        self.answer3_lbl.text = temp
        
        temp = list.randomElement()
        list.remove(at: list.firstIndex(of: temp!)!)
        self.answer4_lbl.text = temp
        
    }
    
    
    @objc func next(_ sender: UIButton?) {
        self.vm.next()
    }
    
    @objc func chooseAnswer(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            
            switch sender.name {
                
            case "chooseAnswer1":
                self.vm.select(option: self.answer1_lbl.text!)
            case "chooseAnswer2":
                self.vm.select(option: self.answer2_lbl.text!)
            case "chooseAnswer3":
                self.vm.select(option: self.answer3_lbl.text!)
            case "chooseAnswer4":
                self.vm.select(option: self.answer4_lbl.text!)
            default:
                break
            }
        }
    }
}



