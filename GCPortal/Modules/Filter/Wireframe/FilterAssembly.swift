//
//  FilterAssembly.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

final class FilterAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {
        
        let view = FilterViewController()
        let router = FilterRouter(transition: view)
        
        let presenter = FilterPresenter()
        
        let interactor = FilterInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return view
    }
}
