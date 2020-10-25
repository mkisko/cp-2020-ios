//
//  UIView+borders.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable
    var borderWidth: CGFloat {
        
        set {
            layer.borderWidth = newValue
        }
        
        get {
            return layer.borderWidth
        }
        
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        
        set {
            layer.borderColor = newValue?.cgColor
        }
        
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = false
        }
        
        get {
            return layer.cornerRadius
        }
    }
    
    func addCornerRadiuses(corners: UIRectCorner, radius: CGFloat) {
        
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
