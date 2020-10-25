//
//  HomeRouter.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol HomeRouterInput {
    
}

final class HomeRouter {
    
    weak var transition: ModuleTransitionHandler?
    
    init(transition: ModuleTransitionHandler?) {
        self.transition = transition
    }
    
}

extension HomeRouter: HomeRouterInput {
    
}
