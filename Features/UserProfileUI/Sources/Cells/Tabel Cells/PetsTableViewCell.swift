//
//  PetsTableViewCell.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 28.10.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import Common

class PetsTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let minimumLineSpacingForSection: CGFloat = 20.0
        
        enum TitleLabel {
            static let fontSize: CGFloat = 18.0
            static let text: String = "Мои питомцы"
                        
            static let topAnchorConstant: CGFloat = 24.0
            static let leadingAnchorConstant: CGFloat = 16.0
            static let heightAnchorConstant: CGFloat = 22.0
        }
        
        enum CollectionView {
            static let topAnchorConstant: CGFloat = 16.0
            static let bottomAnchorConstant: CGFloat = -24.0
            static let leadingAnchorConstant: CGFloat = 16.0
            static let heightAnchorConstant: CGFloat = 80.0
        }
    }
    
    // MARK: - Proporties
    
    private let collectionView = PetsCollectionView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: CustomFontName.medium, size: Constants.TitleLabel.fontSize)
        label.text = Constants.TitleLabel.text
        label.textColor = .black
        return label
    }()
        
    // MARK: - Override functions

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupContraints() {
        setupTitleLabelContraints()
        setupCollectionViewContraints()
    }
    
    private func setupTitleLabelContraints() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.TitleLabel.topAnchorConstant),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.TitleLabel.leadingAnchorConstant),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.TitleLabel.heightAnchorConstant),
        ])
    }
    
    private func setupCollectionViewContraints() {
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.CollectionView.topAnchorConstant),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.CollectionView.bottomAnchorConstant),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: Constants.CollectionView.heightAnchorConstant)
        ])
    }
}
