//
//  UIXView + Extension.swift
//  Common
//
//  Created by Микаэл Мартиросян on 17.10.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

extension UITableView {
    public func registerCell<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseID)
    }
    
    public func dequeueReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: Cell.reuseID, for: indexPath) as? Cell else { fatalError("Fatal error for cell at \(indexPath)") }
        return cell
    }
}

extension UICollectionView {
    public func registerCell<Cell: UICollectionViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellWithReuseIdentifier: cellClass.reuseID)
    }
    
    public func dequeueReusableCell<Cell: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: Cell.reuseID, for: indexPath) as? Cell else { fatalError("Fatal error for cell at \(indexPath)") }
        return cell
    }
}
