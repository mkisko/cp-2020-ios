//
//  LaunchPresenter.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol LaunchViewOutput: ViewOutput {
    
}

protocol LaunchInteractorOutput {

}

final class LaunchPresenter {
    
    var interactor: LaunchInteractorInput?
    var router: LaunchRouterInput?
    weak var view: LaunchViewInput?
    
}

extension LaunchPresenter: LaunchViewOutput {
    func viewIsReady() {
        view?.showLoading()
        view?.hideLoading()
        router?.changeRootViewController()
    }
}

extension LaunchPresenter: LaunchInteractorOutput {
    
}
