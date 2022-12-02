//
//  AddButtonCollectionViewCell.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 22.11.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import CommonUI

class AddButtonCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        enum PlusButton {
            static let heightAnchorConstant: CGFloat = 60.0
            static let widthAnchorConstant: CGFloat = 60.0
        }
    }
    
    // MARK: - Properties
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(CommonUIAsset.add.image, for: .normal)
        return button
    }()
    
    // MARK: - Override functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        plusButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func plusButtonConstraints() {
        contentView.addSubview(plusButton)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plusButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            plusButton.heightAnchor.constraint(equalToConstant: Constants.PlusButton.heightAnchorConstant),
            plusButton.widthAnchor.constraint(equalToConstant: Constants.PlusButton.widthAnchorConstant)
        ])
    }
}
