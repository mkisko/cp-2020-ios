//
//  VacancyPresenter.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol VacancyViewOutput: ViewOutput {
    
}

protocol VacancyInteractorOutput: class {
    
}

final class VacancyPresenter {
    
    weak var view: VacancyViewInput?
    var interactor: VacancyInteractorInput?
    var router: VacancyRouterInput?
    
    private let dataProvider: VacancyDataProviderInput
    
    init(dataProvider: VacancyDataProviderInput) {
        self.dataProvider = dataProvider
    }
}

extension VacancyPresenter: VacancyViewOutput {
    
}

extension VacancyPresenter: VacancyInteractorOutput {
    
}
