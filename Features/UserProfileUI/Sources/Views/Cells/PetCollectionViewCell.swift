//
//  PetCollectionViewCell.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 15.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import Common

class PetCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        enum AvatarImageView {
            static let heightAnchorConstant: CGFloat = 60.0
            static let widthAnchorConstant: CGFloat = 60.0
        }

        enum NameLabel {
            static let fontSize: CGFloat = 11.0
            
            static let topAnchorConstant: CGFloat = 5.0
            static let leadingAnchorConstant: CGFloat = 3.0
            static let trailingAnchorConstant: CGFloat = -3.0
            static let heightAnchorConstant: CGFloat = 15.0
        }
    }
    
    // MARK: - Properties
        
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Constants.NameLabel.fontSize, weight: .regular)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
//    static var reuseID: String {
//        print(String(describing: self))
//        return String(describing: self)
//    }
    
    // MARK: - Override functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
        
        avatarImageView.layer.cornerRadius =  Constants.AvatarImageView.heightAnchorConstant / 2.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        avatarImageView.image = nil
        nameLabel.text = nil
    }
    
    // MARK: - Functions
    
    private func setupConstraints() {
        avatarImageViewConstraints()
        nameLabelConstraints()
    }
    
    private func avatarImageViewConstraints() {
        contentView.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.AvatarImageView.heightAnchorConstant),
            avatarImageView.widthAnchor.constraint(equalToConstant: Constants.AvatarImageView.widthAnchorConstant),
        ])
    }
    
    private func nameLabelConstraints() {
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: Constants.NameLabel.topAnchorConstant),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.NameLabel.leadingAnchorConstant),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.NameLabel.trailingAnchorConstant),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: Constants.NameLabel.heightAnchorConstant)
        ])
    }
}
