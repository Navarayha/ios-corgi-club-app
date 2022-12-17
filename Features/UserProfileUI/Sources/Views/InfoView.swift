//
//  InfoView.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 06.12.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import Common
import CommonUI

class InfoView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        
        enum AvatarImageView {
            static let borderWidth: CGFloat = 0.5
            static let cornerRadius: CGFloat = Constants.AvatarImageView.heightAnchorConstant / 2.0
            
            static let heightAnchorConstant: CGFloat = 120.0
            static let widthAnchorConstant: CGFloat = 120.0
            static let leadingAnchorConstant: CGFloat = 16.0
        }
        
        enum NameLabel {
            static let fontSize: CGFloat = 18.0
            static let numberOfLines: Int = 0
            
            static let topAnchorConstant: CGFloat = 25.0
            static let leadingAnchorConstant: CGFloat = 16.0
            static let trailingAnchorConstant: CGFloat = -16.0
        }
        
        enum EditButton {
            static let backgroundColor: UIColor = UIColor(red: 0.922, green: 0.427, blue: 0.302, alpha: 1)
            static let cornerRadius = 8.0
            static let fontSize: CGFloat = 16.0
            static let title = "Редактировать"
            
            static let topAnchorConstant: CGFloat = 16.0
            static let bottomAnchorConstant: CGFloat = -25.0
            static let widthAnchorConstant: CGFloat = 150.0
            static let heightAnchorConstant: CGFloat = 42.0
        }
        
        enum LocationImageView {
            static let heightAnchorConstant: CGFloat = 16.0
            static let widthAnchorConstant: CGFloat = 16.0
        }
        
        enum LocationLabel {
            static let fontSize: CGFloat = 16.0
            static let numberOfLines: Int = 0
            static let textColor: UIColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
            
            static let topAnchorConstant: CGFloat = 16.0
            static let leadingAnchorConstant: CGFloat = 4.0
            static let trailingAnchorConstant: CGFloat = -16.0
        }
    }
    
    // MARK: - Properties
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = Constants.AvatarImageView.borderWidth
        imageView.layer.borderColor = UIColor.systemGray5.cgColor
        imageView.layer.cornerRadius = Constants.AvatarImageView.cornerRadius
        return imageView
    }()

    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = CommonUIFontFamily.Inter.regular.font(size: Constants.LocationLabel.fontSize)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = Constants.LocationLabel.numberOfLines
        label.textColor = Constants.LocationLabel.textColor
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = CommonUIFontFamily.Inter.medium.font(size: Constants.NameLabel.fontSize)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = Constants.NameLabel.numberOfLines
        label.textColor = .black
        return label
    }()
    
    let editButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.EditButton.backgroundColor
        button.layer.cornerRadius = Constants.EditButton.cornerRadius
        button.setTitle(Constants.EditButton.title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = CommonUIFontFamily.Inter.medium.font(size: Constants.EditButton.fontSize)
        return button
    }()
    
    private let locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = CommonUIAsset.location.image
        return imageView
    }()
    
    // MARK: - Override functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        backgroundColor = .white
        
        createCustomShadow(cornerRadius: 4)
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: CommonUIConstants.View.bigCornerRadius).cgPath
    }
    
    // MARK: - Functions
    
    private func setupContraints() {
        setupAvatarImageViewConstraints()
        setupNameLabelConstraints()
        setupLocationImageViewConstraints()
        setupLocationLabelConstraints()
        setupEditButtonConstraints()
    }

    private func setupAvatarImageViewConstraints() {
        addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.AvatarImageView.leadingAnchorConstant),
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.AvatarImageView.heightAnchorConstant),
            avatarImageView.widthAnchor.constraint(equalToConstant: Constants.AvatarImageView.widthAnchorConstant)
        ])
    }

    private func setupNameLabelConstraints() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.NameLabel.topAnchorConstant),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.NameLabel.leadingAnchorConstant),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.NameLabel.trailingAnchorConstant),
        ])
    }

    private func setupLocationImageViewConstraints() {
        addSubview(locationImageView)
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationImageView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            locationImageView.heightAnchor.constraint(equalToConstant: Constants.LocationImageView.heightAnchorConstant),
            locationImageView.widthAnchor.constraint(equalToConstant: Constants.LocationImageView.widthAnchorConstant)
        ])
    }

    private func setupLocationLabelConstraints() {
        addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.LocationLabel.topAnchorConstant),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: Constants.LocationLabel.leadingAnchorConstant),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.LocationLabel.trailingAnchorConstant),
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor)
        ])
    }

    private func setupEditButtonConstraints() {
        addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: Constants.EditButton.topAnchorConstant),
            editButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.EditButton.bottomAnchorConstant),
            editButton.leadingAnchor.constraint(equalTo: locationImageView.leadingAnchor),
            editButton.widthAnchor.constraint(equalToConstant: Constants.EditButton.widthAnchorConstant),
            editButton.heightAnchor.constraint(equalToConstant: Constants.EditButton.heightAnchorConstant)
        ])
    }
}
