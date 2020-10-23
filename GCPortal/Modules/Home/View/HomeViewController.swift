//
//  ViewController.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 23.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol HomePresenterProtocol {
    
}

final class HomeViewController: UIViewController, AlertPresentable, Loadable {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    
    lazy var presenter: HomePresenter {
        
    }()

}

extension HomeViewController: HomePresenterProtocol {
    
}
