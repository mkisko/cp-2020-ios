//
//  HomeInteractor.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol HomeInteractorInput {
    
}

final class HomeInteractor {
    
    weak var presenter: HomeInteractorOutput?
    
}

extension HomeInteractor: HomeInteractorInput {
    
}
