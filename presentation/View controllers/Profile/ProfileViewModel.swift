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
    func reloadScoresTableView()
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
    
    private var maxScores: [GameEntity] = [] {
        didSet {
            self.delegate?.reloadScoresTableView()
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
        }
        
        getHighestScoreUseCase.execute().then { scores in
            self.maxScores = scores
            print("Profile View Model: \(self.maxScores)")
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
    
    func getMaxScoresCount() -> Int {
        maxScores.count
    }
    
    func getMaxScores(id: Int) -> GameEntity {
        maxScores[id]
    }
}
