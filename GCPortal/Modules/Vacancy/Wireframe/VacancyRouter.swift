//
//  VacancyRouter.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol VacancyRouterInput {
    func openFilter()
}

final class VacancyRouter {
    
    weak var transition: ModuleTransitionHandler?
    
    init(transition: ModuleTransitionHandler?) {
        self.transition = transition
    }
    
}

extension VacancyRouter: VacancyRouterInput {
    
    func openFilter() {
        transition?.push(moduleType: FilterAssembly.self)
    }

}
