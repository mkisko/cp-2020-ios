//
//  HomePresenter.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 23.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol HomeViewProtocol: ViewOutput {
    
}

final class HomePresenter {
    
    weak var view: HomePresenterProtocol?
    
    private let dataProvider = HomeDataProvider()
}


// MARK: - HomeViewProtocol
extension HomePresenter: HomeViewProtocol {
    
    func viewIsReady() {
        let first = HomeModel(course: "1-2 КУРС", isComplete: true, salary: "20 000 - 40 000 рублей", vacancyCount: 8)
        let second = HomeModel(course: "3-4 КУРС", isComplete: true, salary: "40 000 - 60 000 рублей", vacancyCount: 15)
        let third = HomeModel(course: "Аспирантура", isComplete: false, salary: "100 000 - 200 000 рублей", vacancyCount: 21)
        let array = [first, second, third]
        
        let viewModel = dataProvider.createViewModel(data: array)
        view?.update(with: viewModel)
    }
    
}
