//
//  ProfileAssembly.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 25.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

final class ProfileAssembly: Assembly {

    static func assembleModule() -> UIViewController {

        let view = ProfileViewController()
        let router = ProfileRouter(transition: view)

        let presenter = ProfilePresenter()
        
        let interactor = ProfileInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return view
    }
}
