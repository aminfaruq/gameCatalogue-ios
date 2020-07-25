//
//  CardView.swift
//  Game Catalogue
//
//  Created by Amin faruq on 11/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import UIKit

public class CardView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 1 //default
    @IBInspectable var shadow: CGFloat = 1 //default
    @IBInspectable var shadowRadius: CGFloat = 2.0
    @IBInspectable var borderWidth: CGFloat = 0.0
    
    override public func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: shadow)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = shadowRadius
        layer.shadowPath = shadowPath.cgPath
        layer.borderWidth = borderWidth
        layer.borderColor = UIColor(red: 0xF3, green: 0xC6, blue: 0x23, alpha: 1.0).cgColor
    }
    
    
    public func reload() {
        setNeedsDisplay()
        layer.displayIfNeeded()
    }
}
