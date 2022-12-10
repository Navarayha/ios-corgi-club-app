//
//  UIView + Extension.swift
//  Common
//
//  Created by Микаэл Мартиросян on 06.12.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

extension UIView {
    public func createCustomShadow() {
        // Set masks to bounds to false to avoid the shadow
        // from being clipped to the corner radius
        self.layer.cornerRadius = CommonConstants.View.bigCornerRadius
        self.layer.masksToBounds = false
        
        // Apply a shadow
        self.layer.shadowColor = CommonConstants.View.Shadow.shadowColor
        self.layer.shadowOffset = CommonConstants.View.Shadow.shadowOffset
        self.layer.shadowOpacity = CommonConstants.View.Shadow.shadowOpacity
        self.layer.shadowRadius = CommonConstants.View.Shadow.shadowRadius
    }
}
