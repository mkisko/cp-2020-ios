//
//  VacancyDataProvider.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol VacancyDataProviderInput {
    func createViewModel(data: [VacancyModel]) -> VacancyViewModel
}

final class VacancyDataProvider: VacancyDataProviderInput {
    
    // MARK: - Typealiases
    
    typealias VacancyCellConfigurator = TableCellConfigurator<VacancyCell, VacancyCell.Model>
    
    
    // MARK: - VacancyDataProviderInput
    
    func createViewModel(data: [VacancyModel]) -> VacancyViewModel {
        
        var rows: [VacancyViewModel.Row] = []
        
        data.forEach { rows.append(.vacancy(configurator: VacancyCellConfigurator(item: $0))) }
        
        return VacancyViewModel(rows: rows)
    }
    
    
}
