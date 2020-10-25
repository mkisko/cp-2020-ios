//
//  ProfileInteractor.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 25.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol ProfileInteractorInput {
    
}

final class ProfileInteractor {
    
    weak var presenter: ProfileInteractorOutput?
    
}

extension ProfileInteractor: ProfileInteractorInput {
    
}
