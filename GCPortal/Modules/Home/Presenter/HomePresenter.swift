//
//  HomePresenter.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 23.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol HomeViewOutput: ViewOutput {
    
}

protocol HomeInteractorOutput: class {
    
}

final class HomePresenter {
    
    weak var view: HomeViewInput?
    var interactor: HomeInteractorInput?
    var router: HomeRouterInput?
    
    private let dataProvider: HomeDataProviderInput
    
    init(dataProvider: HomeDataProviderInput) {
        self.dataProvider = dataProvider
    }
    
}


// MARK: - HomeViewProtocol
extension HomePresenter: HomeViewOutput {
    
    func viewIsReady() {
        let first = HomeModel(id: 5, status: 1, course: "1 семестр", vacancyCount: 5, salaryMin: 20000, salaryMax: 25000)
        let second = HomeModel(id: 6, status: 1, course: "2 семестр", vacancyCount: 5, salaryMin: 20000, salaryMax: 25000)
        let third = HomeModel(id: 7, status: 0, course: "3 семестр", vacancyCount: 7, salaryMin: 30000, salaryMax: 35000)
        let fourty = HomeModel(id: 8, status: 0, course: "4 семестр", vacancyCount: 8, salaryMin: 30000, salaryMax: 40000)
        let array = [first, second, third, fourty]
        
        let viewModel = dataProvider.createViewModel(data: array)
        view?.update(with: viewModel)
    }
    
}

extension HomePresenter: HomeInteractorOutput {
    
}
