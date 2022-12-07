//
//  AddButtonCollectionViewCell.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 22.11.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import CommonUI

class AddItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        enum AddImageView {
            static let heightAnchorConstant: CGFloat = 60.0
            static let widthAnchorConstant: CGFloat = 60.0
        }
    }
    
    // MARK: - Properties
    
    private let addImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = CommonUIAsset.add.image
        return imageView
    }()
    
    // MARK: - Override functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addImageViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func addImageViewConstraints() {
        contentView.addSubview(addImageView)
        addImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            addImageView.heightAnchor.constraint(equalToConstant: Constants.AddImageView.heightAnchorConstant),
            addImageView.widthAnchor.constraint(equalToConstant: Constants.AddImageView.widthAnchorConstant)
        ])
    }
}
