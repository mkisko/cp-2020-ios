//
//  HomeAssembly.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

final class HomeAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {
        
        let view = HomeViewController()
        let router = HomeRouter(transition: view)
        
        let dataProvider = HomeDataProvider()
        let presenter = HomePresenter(dataProvider: dataProvider)
        
        let interactor = HomeInteractor()
        
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

