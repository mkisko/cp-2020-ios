//
//  HomePresenter.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 23.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol HomeViewProtocol: ViewOutput {
    
}

final class HomePresenter {
    
    weak var view: HomePresenterProtocol?
    
}


// MARK: - HomeViewProtocol
extension HomePresenter: HomeViewProtocol {
    
    func viewIsReady() {
        
    }
    
}
