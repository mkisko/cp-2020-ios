//
//  VacancyViewController.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol VacancyViewInput: Loadable, AlertPresentable {
    
}

final class VacancyViewController: UIViewController {

    var presenter: VacancyViewOutput?
    
    private var viewModel: VacancyViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}

extension VacancyViewController: VacancyViewInput {
    
}
