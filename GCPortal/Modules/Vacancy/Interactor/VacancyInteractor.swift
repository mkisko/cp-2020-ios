//
//  VacancyInteractor.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol VacancyInteractorInput {
    
}

final class VacancyInteractor {
    
    weak var presenter: VacancyInteractorOutput?
    
}

extension VacancyInteractor: VacancyInteractorInput {
    
}
