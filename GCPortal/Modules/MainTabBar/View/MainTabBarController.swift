//
//  MainTabBarController.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 23.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

enum TabBarItem: Int, CaseIterable {
    case home = 0
    case vacancy
    case feedback
    case profile
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return HomeAssembly.assembleModule()
        case .vacancy:
            return UIViewController()
        case .feedback:
            return UIViewController()
        case .profile:
            return UIViewController()
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Мой путь"
        case .vacancy:
            return "Вакансии"
        case .feedback:
            return "Отклики"
        case .profile:
            return "Профиль"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "git-merge")
        case .vacancy:
            return UIImage(named: "search")
        case .feedback:
            return UIImage(named: "file-minus")
        case .profile:
            return UIImage(named: "user")
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "git-merge")
        case .vacancy:
            return UIImage(named: "search")
        case .feedback:
            return UIImage(named: "file-minus")
        case .profile:
            return UIImage(named: "user")
        }
        
    }
}

final class MainTabBarController: UITabBarController {
    
    var output: MainTabBarControllerViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        initTabs()
    }
    
    private func initTabs() {
        viewControllers = TabBarItem.allCases.map {
            
            let viewController = $0.viewController
            
            viewController.tabBarItem.title = $0.title
            viewController.tabBarItem.image = $0.image
            viewController.tabBarItem.selectedImage = $0.selectedImage
            
//            if $0 == .basket {
//                if let count = UserInfoSingelton.shared.getBasketCount(), count > 0 {
//                    viewController.tabBarItem.badgeValue = count.description
//                }
//            }
            
            return viewController
        }
        
        tabBar.tintColor = UIColor(rgb: 0x1B55A0)
        tabBar.barTintColor = .white
    }
    
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
            return false
        }
        
        var feedbackImpackGenerator: UIImpactFeedbackGenerator!
        
        
        if fromView != toView {
            
            UIView.transition(from: fromView, to: toView, duration: 0.2, options: [.transitionCrossDissolve], completion: nil)
            
            if #available(iOS 13.0, *) {
                
                feedbackImpackGenerator = UIImpactFeedbackGenerator(style: .soft)
            } else {
                
                feedbackImpackGenerator = UIImpactFeedbackGenerator(style: .light)
            }
            
            feedbackImpackGenerator.impactOccurred()
            
        } else {
            
            fromView.allSubViews.forEach {
                 if let tableView = $0 as? UITableView {
                    if tableView.numberOfSections != 0 && tableView.numberOfRows(inSection: 0) != 0 {
                         tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
                     }
                 }
             }

        }
        return true
    }
    
}

extension MainTabBarController: MainTabBarControllerViewInput {
    
}

