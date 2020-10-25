//
//  LaunchAssembly.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

final class LaunchAssembly: Assembly {
    static func assembleModule() -> UIViewController {
        let view = LaunchViewController()
        
        let presenter = LaunchPresenter()
        let router = LaunchRouter(transition: view)
        
        let interactor = LaunchInteractor()
        
        view.presenter = presenter
        presenter.view = view
        
        presenter.router = router
        
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view.wrappedInNavigationController()
    }
}
