//
//  ViewController.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 23.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol HomePresenterProtocol: AlertPresentable, Loadable {
    
}

final class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    
    var presenter: HomePresenter {
        let presenter = HomePresenter()
        presenter.view = self
        return presenter
    }

}

extension HomeViewController: HomePresenterProtocol {
    
}
