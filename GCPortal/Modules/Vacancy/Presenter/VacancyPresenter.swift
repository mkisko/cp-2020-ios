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
        let test = VacancyModel(id: 1, title: "Менеджер по продажам на телефоне", description: "", skills: [skill], company: company, minCost: 1000, maxCost: 20000, typeIntern: 0, user: user, expiried: "2020-12-20T00:00:00+00:00", publishedAt: "2020-10-24T10:00:00+00:00", conditions: "Тут какой то текст", city: "Саратов", progress: 92)
        
        let company1 = CompanyModel(id: 1, title: "РАО ЕЭС", description: "Оператор связи")
        let test1 = VacancyModel(id: 1, title: "Офис-менеджер", description: "", skills: [skill], company: company1, minCost: 1000, maxCost: 24000, typeIntern: 0, user: user, expiried: "2020-12-20T00:00:00+00:00", publishedAt: "2020-10-24T10:00:00+00:00", conditions: "Тут какой то текст", city: "Пятигорск", progress: 73)
        
        let company2 = CompanyModel(id: 1, title: "ООО Сычев и Ко", description: "Оператор связи")
        let test2 = VacancyModel(id: 1, title: "Консультант", description: "", skills: [skill], company: company2, minCost: 1000, maxCost: 27000, typeIntern: 0, user: user, expiried: "2020-12-20T00:00:00+00:00", publishedAt: "2020-10-24T10:00:00+00:00", conditions: "Тут какой то текст", city: "Ставрополь", progress: 45)
        
        let company3 = CompanyModel(id: 1, title: "RedMadRobot", description: "Оператор связи")
        let test3 = VacancyModel(id: 1, title: "Юрист", description: "", skills: [skill], company: company3, minCost: 1000, maxCost: 32000, typeIntern: 0, user: user, expiried: "2020-12-20T00:00:00+00:00", publishedAt: "2020-10-24T10:00:00+00:00", conditions: "Тут какой то текст", city: "Ставрополь", progress: 34)
        
        let company4 = CompanyModel(id: 1, title: "2ГИС", description: "Оператор связи")
        let test4 = VacancyModel(id: 1, title: "РОП", description: "", skills: [skill], company: company4, minCost: 1000, maxCost: 37000, typeIntern: 0, user: user, expiried: "2020-12-20T00:00:00+00:00", publishedAt: "2020-10-24T10:00:00+00:00", conditions: "Тут какой то текст", city: "Ставрополь", progress: 23)
        
        
        let viewModel = dataProvider.createViewModel(data: [test, test1, test2, test3, test4])
        view?.update(with: viewModel)
    }
}

extension VacancyPresenter: VacancyInteractorOutput {
    
}
