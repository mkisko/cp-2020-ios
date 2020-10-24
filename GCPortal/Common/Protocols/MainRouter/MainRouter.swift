//
//  MainRouter.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

final class MainRouter {
    
    // MARK: - Singleton
    
    static let shared = MainRouter()
    
    
    // MARK: - Properties
    
    private var window: UIWindow {
        guard let window = UIApplication.shared.keyWindow else {
            
            let window = UIWindow(frame:  UIScreen.main.bounds)
            window.makeKeyAndVisible()
            return window
        }
        
        return window
    }
    
    
    // MARK: - Init
    
    private init() { }
    
    
    // MARK: - Public methods
    
    func openMainTabBar() {
        let tabBar = MainTabBarControllerAssembly.assembleModule()
        window.rootViewController = tabBar
    }
    
    func replaceRootController(on view: UIViewController) {
        window.rootViewController = view
    }
    
    func replaceRootController<ModuleType: Assembly>(moduleType: ModuleType.Type) {
        let view = moduleType.assembleModule()
        replaceRootController(on: view)
    }
    
    func presentOnRoot(view: UIViewController, animated: Bool, completion: (() -> Void)?) {
        window.rootViewController?.present(view, animated: animated, completion: completion)
    }
    
    func presentOnRoot<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType.Type) {
        window.rootViewController?.present(with: model, openModuleType: openModuleType)
    }
    
    func presentOnRoot<ModuleType: Assembly>(moduleType: ModuleType.Type) {
        window.rootViewController?.present(moduleType: moduleType)
    }
}
