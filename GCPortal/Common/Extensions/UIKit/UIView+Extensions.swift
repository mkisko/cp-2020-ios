//
//  UIView+Extensions.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - Add navigationController to ViewController
    
    func wrappedInNavigationController() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
    
    func setCustomBackIcon(tintColor: UIColor = Colors.grey ) {
        let backItem = UIBarButtonItem()
        backItem.tintColor = tintColor
        backItem.title = ""
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButton")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backButton")
        navigationItem.backBarButtonItem = backItem
    }
    
    func removeRightBarItems() {
        navigationItem.rightBarButtonItem = nil
    }
}
