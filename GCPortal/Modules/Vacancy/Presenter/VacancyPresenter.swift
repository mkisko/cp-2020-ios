//
//  VacancyPresenter.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol VacancyViewOutput: ViewOutput {
    func filterButtonClick()
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
    
    func filterButtonClick() {
        router?.openFilter()
    }

    func viewIsReady() {
        let skill = SkillModel(id: 1, title: "iOS")
        let company = CompanyModel(id: 1, title: "Билайн", description: "Оператор связи")
        let user = UserModel(id: 1, email: "derzhsv@gmail.com")
        let test = VacancyModel(id: 1, title: "Менеджер по продажам на телефоне", description: "", skills: [skill], company: company, minCost: 1000, maxCost: 20000, typeIntern: 0, user: user, expiried: "2020-12-20T00:00:00+00:00", publishedAt: "2020-10-24T10:00:00+00:00", conditions: "Тут какой то текст", city: "Саратов")
        let viewModel = dataProvider.createViewModel(data: [test])
        view?.update(with: viewModel)
    }
}

extension VacancyPresenter: VacancyInteractorOutput {
    
}
