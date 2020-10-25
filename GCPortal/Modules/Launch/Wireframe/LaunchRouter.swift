//
//  LaunchRouter.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

protocol LaunchRouterInput {
    
    func changeRootViewController()
}

final class LaunchRouter {
    
    
    private weak var transition: ModuleTransitionHandler?
    
    init(transition: ModuleTransitionHandler?) {
        self.transition = transition
    }
    
    
}

extension LaunchRouter: LaunchRouterInput {
    
    func changeRootViewController() {
//        transition?.present(moduleType: OrderAssembly.self)
        MainRouter.shared.openMainTabBar()
    }
    
}
