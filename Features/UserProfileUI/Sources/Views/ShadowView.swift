//
//  ShadowView.swift
//  Common
//
//  Created by Микаэл Мартиросян on 30.11.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    override var bounds: CGRect {
        didSet {
            setupShadow()
        }
    }

    private func setupShadow() {
        self.layer.cornerRadius = 8
//        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 25
        self.layer.shadowOpacity = 1
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 0, height: 0)).cgPath
        self.layer.shouldRasterize = true
//        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
