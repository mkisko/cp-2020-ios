//
//  VacancyAssembly.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

final class VacancyAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {
               
               let view = VacancyViewController()
               let router = VacancyRouter(transition: view)
               
               let dataProvider = VacancyDataProvider()
               let presenter = VacancyPresenter(dataProvider: dataProvider)
               
               let interactor = VacancyInteractor()
               
               view.presenter = presenter
               
               presenter.view = view
               presenter.interactor = interactor
               presenter.router = router
               
               interactor.presenter = presenter
               
               let nav = ColorableNavigationController(rootViewController: view)
               nav.modalPresentationStyle = .overFullScreen
               
               return nav
    }
}
