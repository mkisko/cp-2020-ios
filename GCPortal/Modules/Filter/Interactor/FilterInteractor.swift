//
//  FilterInteractor.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol FilterInteractorInput {
    
}

final class FilterInteractor {
    
    weak var presenter: FilterInteractorOutput?
    
}

extension FilterInteractor: FilterInteractorInput {
    
}
