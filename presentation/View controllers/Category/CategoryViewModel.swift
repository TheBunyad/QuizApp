//
//  CategoryViewModel.swift
//  presentation
//
//  Created by Bunyad Majidzade on 13.09.22.
//

import Foundation
import Promises
import domain
import RxSwift
import UIKit

public class CategoryViewModel {
    private var getCategoryUseCase: GetCategoryUseCase
    
    public init(getCategoryUseCase: GetCategoryUseCase) {
        self.getCategoryUseCase = getCategoryUseCase
    }
    
    func getCategory() -> Promise<[CategoryEntity]> {
        let useCase = self.getCategoryUseCase
        
        return useCase.execute()
    }
    
    
}
