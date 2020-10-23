//
//  HomeViewModel.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit.UIView

struct HomeViewModel {
    
    let rows: [Row]
    
    enum Row {
        
        case home(configurator: TableCellConfiguratorProtocol)
        
        var configurator: TableCellConfiguratorProtocol {
            
            switch self {
                
            case let .home(configurator):
                
                return configurator
            }
        }
        
        var reuseId: String {
            return type(of: configurator).reuseId
        }
    }
}
