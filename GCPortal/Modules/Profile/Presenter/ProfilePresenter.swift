//
//  ProfilePresenter.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 25.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol ProfileViewOutput: ViewOutput {
    
}

protocol ProfileInteractorOutput: class {
    
}

final class ProfilePresenter {
    
    weak var view: ProfileViewInput?
    var interactor: ProfileInteractorInput?
    var router: ProfileRouterInput?
    
}

extension ProfilePresenter: ProfileViewOutput {
    
}

extension ProfilePresenter: ProfileInteractorOutput {
    
}
