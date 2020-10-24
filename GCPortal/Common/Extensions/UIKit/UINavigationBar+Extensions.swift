//
//  UINavigationBar+Extensions.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//


import UIKit

extension UINavigationBar {
    
    // MARK: - Tranparent NavigationBar
    
    func setTransparent() {
        isTranslucent = true
        barStyle = .default
        setBackgroundImage(UIImage(), for: .default)
        UIApplication.shared.keyWindow?.backgroundColor = .white
        shadowImage = UIImage()
    }
    
    
    // MARK: - White NavigationBar
    
    func setWhiteStyle() {
        setValue(true, forKey: "hidesShadow")
        barTintColor = .white
        barStyle = .default
        isTranslucent = false
        UIApplication.shared.keyWindow?.backgroundColor = .white
        statusBarView()?.backgroundColor = .white
    }
    
    
    // MARK: - Set title withOut title tabbarItem
    
    func setTitleColor(color: UIColor) {
        titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
    }
    
    // MARK: - get statusBar, or create statusBar
    
    
    func statusBarView() -> UIView? {
        var statusBarView: UIView?
        
        if #available(iOS 13.0, *) {
            if let view = UIApplication.shared.keyWindow?.allSubViews.filter({ $0.tag == 1 }).first {
                
                return view
            } else {
                
                statusBarView = UIView()
                statusBarView?.tag = 1
                let frame = UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame
                statusBarView?.frame = frame!
                statusBarView?.backgroundColor = .white
                UIApplication.shared.keyWindow?.addSubview(statusBarView!)
                return statusBarView
            }
            
        } else {
            
            statusBarView = UIApplication.shared.value(forKey: "statusBar") as? UIView
        }
        
        return statusBarView
    }
    
}
