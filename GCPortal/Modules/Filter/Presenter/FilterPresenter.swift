//
//  FilterPresenter.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol FilterViewOutput: ViewOutput {
    func buttonTapped()
}

protocol FilterInteractorOutput: class {
    
}

final class FilterPresenter {
    
    weak var view: FilterViewInput?
    var interactor: FilterInteractorInput?
    var router: FilterRouterInput?
    
}

extension FilterPresenter: FilterViewOutput {
    func buttonTapped() {
        router?.pop()
    }

}

extension FilterPresenter: FilterInteractorOutput {
    
}
