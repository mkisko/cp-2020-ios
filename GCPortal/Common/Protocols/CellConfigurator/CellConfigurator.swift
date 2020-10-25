//
//  CellConfigurator.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol ViewConfigurator {
    
    static var reuseId: String { get }
    
    func configure(cell: UIView)
    func associatedValue<T>() -> T?
}


protocol TableCellConfiguratorProtocol: ViewConfigurator {
    var cellHeight: CGFloat { get }
    var headerHeight: CGFloat { get }
}


protocol CollectionCellConfiguratorProtocol: ViewConfigurator {
    var size: CGSize { get }
}
