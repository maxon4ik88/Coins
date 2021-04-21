//
//  UIView+Constraints.swift
//  Coins
//
//  Created by Maxon on 07.03.2021.
//

import UIKit

extension UIView {
    func anchor (top: NSLayoutYAxisAnchor?,
                 left: NSLayoutXAxisAnchor?,
                 bottom: NSLayoutYAxisAnchor?,
                 right: NSLayoutXAxisAnchor?,
                 paddingTop: CGFloat,
                 paddingLeft: CGFloat,
                 paddingBottom: CGFloat,
                 paddingRight: CGFloat,
                 width: CGFloat,
                 height: CGFloat,
                 enableInsets: Bool) {
        var topInset = CGFloat(0.0)
        var bottomInset = CGFloat(0.0)
        
        if #available(iOS 13, *), enableInsets {
            let insets = safeAreaInsets
            topInset = insets.top
            bottomInset = insets.bottom
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop + topInset).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom - bottomInset).isActive = true
        }
        
        if height != 0.0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if width != 0.0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
}
