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
   
    private var white = UIColor.white
    
    private var subscription: Disposable? = nil
    private let disposeBag: DisposeBag = DisposeBag()
    
    //MARK: - UI Elements
    
    private lazy var pageTitle_lbl: UILabel = {
        let lbl = UILabel()
        self.view.addSubview(lbl)
        lbl.text = "QuizApp"
        lbl.font = UIFont(font: FontFamily.Poppins.semiBold, size: 20)
        lbl.textColor = bluePageTitle
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    private lazy var question_lbl: UILabel = {
        let view = UILabel()
        self.view.addSubview(view)
        view.font = UIFont(font: FontFamily.Poppins.regular, size: 18)
        view.textColor = black
        view.numberOfLines = 0
        
        return view
    }()
    
    private lazy var answer1_ui: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = blueButtonBackground
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var answer1_lbl: UILabel = {
        let view = UILabel()
        self.answer1_ui.addSubview(view)
        view.font = UIFont(font: FontFamily.Poppins.regular, size: 16)
        view.textColor = black
        
        return view
    }()
    
    private lazy var answer2_ui: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = blueButtonBackground
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var answer2_lbl: UILabel = {
        let view = UILabel()
        self.answer2_ui.addSubview(view)
        view.font = UIFont(font: FontFamily.Poppins.regular, size: 16)
        view.textColor = black
        
        return view
    }()
    
    private lazy var answer3_ui: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = blueButtonBackground
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var answer3_lbl: UILabel = {
        let view = UILabel()
        self.answer3_ui.addSubview(view)
        view.font = UIFont(font: FontFamily.Poppins.regular, size: 16)
        view.textColor = black
        
        
        return view
    }()
    
    private lazy var answer4_ui: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = blueButtonBackground
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var answer4_lbl: UILabel = {
        let view = UILabel()
        self.answer4_ui.addSubview(view)
        view.font = UIFont(font: FontFamily.Poppins.regular, size: 16)
        view.textColor = black
        
        return view
    }()
    
    private lazy var next_btn: UIButton = {
        let button = UIButton()
        self.view.addSubview(button)
        button.backgroundColor = orange
        button.setTitle("Next", for: .normal)
        button.setTitleColor(black, for: .normal)
        button.titleLabel?.font = UIFont(font: FontFamily.Poppins.regular, size: 16)
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(next(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var timerBackround_ui: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = orange
        view.clipsToBounds = true
        view.layer.cornerRadius = screenHeight * 0.028
        
        return view
    }()
    
    private lazy var timer_lbl: UILabel = {
        let lbl = UILabel()
        self.timerBackround_ui.addSubview(lbl)
        lbl.font = UIFont(font: FontFamily.Poppins.medium, size: 16)
        lbl.textColor = black
        
        return lbl
    }()
    
    private lazy var questionNumber_lbl: UILabel = {
        let lbl = UILabel()
        self.view.addSubview(lbl)
        lbl.textColor = black
        lbl.font = UIFont(font: FontFamily.Poppins.medium, size: 16)
        lbl.textAlignment = .right
        
        return lbl
    }()
    
    //MARK: - ViewDidLoad
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isUserInteractionEnabled = false
        
        view.backgroundColor = self.backgournd
        
        self.setUpUI()
        
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
    
    //MARK: - Functions
    
    func handle(_ state: GameState) {
        switch state {
        case .pending:
            break
        case .inProgress(let question):
            if self.vm.isLastQuestion() {
                self.next_btn.setTitle("Completed", for: .normal)
            }
            self.setup(question: question)
            
            
            let questionSubscribtion = self.vm.observeQuestionState()
                .subscribe { recieved in
                    guard let questionState = recieved.element else { return }
                    let correctAnswer = self.vm.getCorrectAnswer(correctAnswer: question.correctAnswer)
                    switch questionState {
                        
                    case .pending(let remainingSec):
                        self.timer_lbl.text = String(remainingSec)
                    case .correct:
                        if self.answer1_lbl.text == correctAnswer {
                            self.answer1_ui.backgroundColor = .systemGreen
                        } else if self.answer2_lbl.text == correctAnswer {
                            self.answer2_ui.backgroundColor = .systemGreen
                        } else if self.answer3_lbl.text == correctAnswer {
                            self.answer3_ui.backgroundColor = .systemGreen
                        } else if self.answer4_lbl.text == correctAnswer {
                            self.answer4_ui.backgroundColor = .systemGreen
                        }
                        
                    case .wrong(let option):
                        if self.answer1_lbl.text == option {
                            self.answer1_ui.backgroundColor = .systemRed
                        } else if self.answer2_lbl.text == option {
                            self.answer2_ui.backgroundColor = .systemRed
                        } else if self.answer3_lbl.text == option {
                            self.answer3_ui.backgroundColor = .systemRed
                        } else if self.answer4_lbl.text == option {
                            self.answer4_ui.backgroundColor = .systemRed
                        }
                        
                        if self.answer1_lbl.text == correctAnswer {
                            self.answer1_ui.backgroundColor = .systemGreen
                        } else if self.answer2_lbl.text == correctAnswer {
                            self.answer2_ui.backgroundColor = .systemGreen
                        } else if self.answer3_lbl.text == correctAnswer {
                            self.answer3_ui.backgroundColor = .systemGreen
                        } else if self.answer4_lbl.text == correctAnswer {
                            self.answer4_ui.backgroundColor = .systemGreen
                        }
                    case .timeout:
                        if self.answer1_lbl.text == correctAnswer {
                            self.answer1_ui.backgroundColor = .systemYellow
                        } else if self.answer2_lbl.text == correctAnswer {
                            self.answer2_ui.backgroundColor = .systemYellow
                        } else if self.answer3_lbl.text == correctAnswer {
                            self.answer3_ui.backgroundColor = .systemYellow
                        } else if self.answer4_lbl.text == correctAnswer {
                            self.answer4_ui.backgroundColor = .systemYellow
                        }
                    }
                }
            
            questionSubscribtion.disposed(by: disposeBag)
            
        case .completed:
            let vc = self.router.resultViewController(correctAnswers: self.vm.correctAnswerCount, score: self.vm.getScore(), difficulty: vm.getDifficulty(), category: vm.getCategory(), categoryName: vm.getCategoryNames())
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //MARK: - Setup DATA
    
    func setup(question: QuestionEntity) {
        self.question_lbl.text = self.vm.stringFormatter(text: question.question)
        var list: [String] = [
            self.vm.stringFormatter(text: question.correctAnswer),
            self.vm.stringFormatter(text: question.incorrectAnswers[0]),
            self.vm.stringFormatter(text: question.incorrectAnswers[1]),
            self.vm.stringFormatter(text: question.incorrectAnswers[2])
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
        
        self.questionNumber_lbl.text = "\(vm.getCurrentIndex() + 1) / 10"
        
    }
    
    //MARK: - Setup UI
    
    func setUpUI() {
        
        self.pageTitle_lbl.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(self.view.snp.top).offset(screenHeight * 0.08)
        }
        
        self.timerBackround_ui.snp.makeConstraints { make in
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.top.equalTo(self.pageTitle_lbl.snp.bottom).offset(30)
            make.height.equalTo(screenHeight * 0.055)
            make.width.equalTo(screenHeight * 0.055)
        }
        
        self.timer_lbl.snp.makeConstraints { make in
            make.center.equalTo(self.timerBackround_ui.snp.center)
        }
        
        self.question_lbl.snp.makeConstraints { make in
            make.top.equalTo(self.timerBackround_ui.snp.bottom).offset(screenHeight * 0.05)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
        }
        
        self.answer1_ui.snp.makeConstraints { make in
            make.bottom.equalTo(self.answer2_ui.snp.top).offset(-16)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.height.equalTo(screenHeight * 0.0675)
        }
        
        self.answer1_lbl.snp.makeConstraints { make in
            make.center.equalTo(self.answer1_ui.snp.center)
        }
        
        self.answer2_ui.snp.makeConstraints { make in
            make.bottom.equalTo(self.answer3_ui.snp.top).offset(-16)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.height.equalTo(screenHeight * 0.0675)
        }
        
        self.answer2_lbl.snp.makeConstraints { make in
            make.center.equalTo(self.answer2_ui.snp.center)
        }
        
        self.answer3_ui.snp.makeConstraints { make in
            make.bottom.equalTo(self.answer4_ui.snp.top).offset(-16)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.height.equalTo(screenHeight * 0.0675)
        }
        
        self.answer3_lbl.snp.makeConstraints { make in
            make.center.equalTo(self.answer3_ui.snp.center)
        }
        
        self.answer4_ui.snp.makeConstraints { make in
            make.bottom.equalTo(self.next_btn.snp.top).offset(-24)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.height.equalTo(screenHeight * 0.0675)
        }
        
        self.answer4_lbl.snp.makeConstraints { make in
            make.center.equalTo(self.answer4_ui.snp.center)
        }
        
        self.next_btn.snp.makeConstraints { make in
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(screenWidth * 0.5)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.height.equalTo(screenHeight * 0.0675)
        }
        
        self.questionNumber_lbl.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.top.equalTo(self.timer_lbl.snp.top)
            make.width.equalTo(55)
        }
    }
    
    @objc func next(_ sender: UIButton?) {
        
        self.vm.next()
        self.answer1_ui.backgroundColor = blueButtonBackground
        self.answer2_ui.backgroundColor = blueButtonBackground
        self.answer3_ui.backgroundColor = blueButtonBackground
        self.answer4_ui.backgroundColor = blueButtonBackground
    }
    
    @objc func chooseAnswer(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            
            switch sender.view {
                
            case self.answer1_ui:
                self.vm.select(option: self.answer1_lbl.text!)
            case self.answer2_ui:
                self.vm.select(option: self.answer2_lbl.text!)
            case self.answer3_ui:
                self.vm.select(option: self.answer3_lbl.text!)
            case self.answer4_ui:
                self.vm.select(option: self.answer4_lbl.text!)
            default:
                break
            }
        }
    }
}



