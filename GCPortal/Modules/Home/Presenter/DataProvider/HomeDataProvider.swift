//
//  HomeDataProvider.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol HomeDataProviderInput {
    func createViewModel(data: [HomeModel]) -> HomeViewModel
}

final class HomeDataProvider: HomeDataProviderInput {
    
    // MARK: - Typealiases
    
    typealias HomeCellConfigurator = TableCellConfigurator<HomeCell, HomeCell.Model>
    
    
    // MARK: - HomeDataProviderInput
    
    func createViewModel(data: [HomeModel]) -> HomeViewModel {
        
        var rows: [HomeViewModel.Row] = []
        
        data.forEach { rows.append(.home(configurator: HomeCellConfigurator(item: $0))) }
        
        return HomeViewModel(rows: rows)
    }
    
    
    
}
