//
//  UIView+Subviews.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

extension UIView {
    
    var allSubViews: [UIView] {
        
        var array = [self.subviews].flatMap {$0}
        
        array.forEach { array.append(contentsOf: $0.allSubViews) }
        
        return array
    }
    
}
