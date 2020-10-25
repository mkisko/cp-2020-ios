//
//  ProfileRouter.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 25.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol ProfileRouterInput {
    
}

final class ProfileRouter {
    
    weak var transition: ModuleTransitionHandler?
    
    init(transition: ModuleTransitionHandler?) {
        self.transition = transition
    }
    
}

extension ProfileRouter: ProfileRouterInput {
    
}
