//
//  UIXViewCell + Extension.swift
//  Common
//
//  Created by Микаэл Мартиросян on 17.10.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

public extension UICollectionViewCell {
    static var reuseID: String {
        return String(describing: self)
    }
}

public extension UITableViewCell {
    static var reuseID: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable {}

extension UICollectionViewCell: Reusable {}
