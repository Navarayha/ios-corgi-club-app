//
//  UIColor + Extension.swift
//  CommonUI
//
//  Created by Микаэл Мартиросян on 15.10.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

public extension UIColor {
    func CCRgbColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        let red = red / 255.0
        let green = green / 255.0
        let blue = blue / 255.0
        let alpha = alpha
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
