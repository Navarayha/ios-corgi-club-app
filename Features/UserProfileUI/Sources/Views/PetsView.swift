//
//  PetsView.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 06.12.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import Common
import CommonUI

class PetsView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
                
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
    
    private let collectionView: PetsCollectionView
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = CommonUIFontFamily.Inter.medium.font(size: Constants.TitleLabel.fontSize)
        label.text = Constants.TitleLabel.text
        label.textColor = .black
        return label
    }()
        
    // MARK: - Initializers

    init(frame: CGRect, petDelegate: PetControllerDelegate) {
        
        collectionView = PetsCollectionView(frame: frame, petDelegate: petDelegate)
        
        super.init(frame: frame)
        
        backgroundColor = .white
        
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
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.TitleLabel.topAnchorConstant),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.TitleLabel.leadingAnchorConstant),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.TitleLabel.heightAnchorConstant),
        ])
    }
    
    private func setupCollectionViewContraints() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.CollectionView.topAnchorConstant),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.CollectionView.bottomAnchorConstant),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: Constants.CollectionView.heightAnchorConstant)
        ])
    }
}
