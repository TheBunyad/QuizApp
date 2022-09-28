//
//  ProfileViewModel.swift
//  presentation
//
//  Created by Bunyad Majidzade on 27.09.22.
//

import Foundation
import domain


public class ProfileViewModel {
    
    private var updateRecordUseCase: UpdateRecordUseCase
    private var updateHighestScoreUseCase: UpdateHighestScoreUseCase
    private var updateUserNameUseCase: UpdateUsernameUseCase
    private var getRecordUseCase: GetRecordUseCase
    private var getHighestScoreUseCase: GetHighestScoresUseCase
    private var getUserNameUseCase: GetUserNameUseCase
    private var setDataUseCase: SetDataUseCase
    
    private var gameRecord: GameEntity?
    private var count = 0
    
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
    }
    
//    func getGameRecordsCount() -> Int {
//        getRecordUseCase.execute().then { records in
//            let count = records.count
//            print(count)
//            return count
//        }
//
//
//    }
    
    func getGameRecord(id: Int) -> GameEntity {
        getRecordUseCase.execute().then({ records in
            self.gameRecord = records[id]
        })
        print("view model\(self.gameRecord!)")
        return self.gameRecord!
    }
    
    func mockData() {
        self.setDataUseCase.execute(userName: "Username", highestScores: [GameEntity(categoryName: "Category", score: 10)], records: [GameEntity(categoryName: "Category", score: 10)]).then { _ in
            print("worked")
        }.catch { error in
            print(error)
        }
    }
}

