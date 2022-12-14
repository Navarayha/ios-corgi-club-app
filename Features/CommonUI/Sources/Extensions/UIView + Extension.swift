//
//  UIView + Extension.swift
//  CommonUI
//
//  Created by Микаэл Мартиросян on 06.12.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

extension UIView {
    public func createCustomShadow(cornerRadius: CGFloat) {
        // Set masks to bounds to false to avoid the shadow
        // from being clipped to the corner radius
//        layer.cornerRadius = cornerRadius //CommonUIConstants.View.bigCornerRadius
        layer.masksToBounds = false
        
        // Apply a shadow
        layer.shadowColor = CommonUIConstants.View.Shadow.shadowColor
        layer.shadowOffset = CommonUIConstants.View.Shadow.shadowOffset
        layer.shadowOpacity = CommonUIConstants.View.Shadow.shadowOpacity
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.shadowRadius = CommonUIConstants.View.Shadow.shadowRadius
    }
    
    public func createCornerRadius() -> CGFloat {
        return frame.height / 2.0
    }
}
