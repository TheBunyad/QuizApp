//
//  ProfileViewModel.swift
//  presentation
//
//  Created by Bunyad Majidzade on 27.09.22.
//

import Foundation
import domain

protocol ProfileViewDelegate: AnyObject {
    func reloadTableView()
}

public class ProfileViewModel {
    
    private weak var delegate: ProfileViewDelegate?
    private var updateRecordUseCase: UpdateRecordUseCase
    private var updateHighestScoreUseCase: UpdateHighestScoreUseCase
    private var updateUserNameUseCase: UpdateUsernameUseCase
    private var getRecordUseCase: GetRecordUseCase
    private var getHighestScoreUseCase: GetHighestScoresUseCase
    private var getUserNameUseCase: GetUserNameUseCase
    private var setDataUseCase: SetDataUseCase
    
    private var gameRecords: [GameEntity] = [] {
        didSet {
            self.delegate?.reloadTableView()
        }
    }
    
    init(
        updateRecordUseCase: UpdateRecordUseCase,
        updateHighestScoreUseCase: UpdateHighestScoreUseCase,
        updateUserNameUseCase: UpdateUsernameUseCase,
        getRecordUseCase: GetRecordUseCase,
        getHighestScoreUseCase: GetHighestScoresUseCase,
        getUserNameUseCase: GetUserNameUseCase,
        setDataUseCase: SetDataUseCase
    ) {
        self.updateRecordUseCase = updateRecordUseCase
        self.updateHighestScoreUseCase = updateHighestScoreUseCase
        self.updateUserNameUseCase = updateUserNameUseCase
        self.getRecordUseCase = getRecordUseCase
        self.getHighestScoreUseCase = getHighestScoreUseCase
        self.getUserNameUseCase = getUserNameUseCase
        self.setDataUseCase = setDataUseCase
        
        getRecordUseCase.execute().then { records in
                self.gameRecords = records
                print("Profile View Model: \(records)")
        }
    }
    
    func set(delegate: ProfileViewDelegate) {
        self.delegate = delegate
    }
    
    func getGameRecordsCount() -> Int {
        gameRecords.count
    }
    
    func getGameRecord(id: Int) -> GameEntity {
       gameRecords[id]
    }
    
    func mockData() {
        self.setDataUseCase.execute(userName: "Username", highestScores: [GameEntity(categoryName: "Category", score: 10)], records: [GameEntity(categoryName: "Category", score: 10)]).then { _ in
            print("worked")
        }.catch { error in
            print(error)
        }
    }
}
