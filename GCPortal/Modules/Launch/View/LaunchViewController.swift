//
//  LaunchViewController.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol LaunchViewInput: Loadable, AlertPresentable {
    
}

final class LaunchViewController: UIViewController {
    
    var presenter: LaunchViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.presenter?.viewIsReady()
    }
    
}

extension LaunchViewController: LaunchViewInput {
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
}
