//
//  VacancyViewModel.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit.UIView

struct VacancyViewModel {
    
    let rows: [Row]
    
    enum Row {
        
        case vacancy(configurator: TableCellConfiguratorProtocol)
        
        var configurator: TableCellConfiguratorProtocol {
            
            switch self {
                
            case let .vacancy(configurator):
                
                return configurator
            }
        }
        
        var reuseId: String {
            return type(of: configurator).reuseId
        }
    }
}
