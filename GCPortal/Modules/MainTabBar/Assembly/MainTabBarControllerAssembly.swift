//
//  MainTabBarControllerAssembly.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

final class MainTabBarControllerAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {
        let view = MainTabBarController()
        let presenter = MainTabBarControllerPresenter()
        presenter.view = view
        view.output = presenter
        
        return view
    }

}
