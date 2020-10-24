//
//  ColorableNavigationController.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

public protocol NavigationBarColorable: class {
    var navigationTintColor: UIColor? { get }
    var navigationBarTintColor: UIColor? { get }
}

public extension NavigationBarColorable {
    var navigationTintColor: UIColor? { return nil }
    var navigationBarTintColor: UIColor? { return nil }
}

open class ColorableNavigationController: UINavigationController {
    private var previousViewController: UIViewController? {
        guard viewControllers.count > 1 else {
            return nil
        }
        return viewControllers[viewControllers.count - 2]
    }
    
    override open func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if let colors = viewController as? NavigationBarColorable {
            self.setNavigationBarColors(colors)
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    override open func popViewController(animated: Bool) -> UIViewController? {
                
        if let colors = self.previousViewController as? NavigationBarColorable {
            self.setNavigationBarColors(colors)
        }
        
        // Let's start pop action or we can't get transitionCoordinator()
        let popViewController = super.popViewController(animated: animated)
        
        // Secure situation if user cancelled transition
        transitionCoordinator?.animate(alongsideTransition: nil, completion: { [weak self] (context) in
            guard let colors = self?.topViewController as? NavigationBarColorable else { return }
            self?.setNavigationBarColors(colors)
            })
        
        return popViewController
    }
    
    private func setNavigationBarColors(_ colors: NavigationBarColorable) {
        
        if let tintColor = colors.navigationTintColor {
            self.navigationBar.tintColor = tintColor
        }
        
        self.navigationBar.barTintColor = colors.navigationBarTintColor
    }
}

