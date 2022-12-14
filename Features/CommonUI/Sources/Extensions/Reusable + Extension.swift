//
//  Reusable + Extension.swift
//  CommonUI
//
//  Created by Микаэл Мартиросян on 08.12.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import Common

extension Reusable where Self: UIView {
    static var reuseID: String {
        return String(describing: self)
    }
}
