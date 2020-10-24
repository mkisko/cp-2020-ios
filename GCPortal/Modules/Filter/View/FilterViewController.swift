//
//  FilterViewController.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol FilterViewInput: Loadable, AlertPresentable {
    
}

final class FilterViewController: UIViewController {

    var presenter: FilterViewOutput?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}

extension FilterViewController: FilterViewInput {
    
}
