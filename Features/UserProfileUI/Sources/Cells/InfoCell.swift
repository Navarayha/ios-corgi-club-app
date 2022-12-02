//
//  InfoCell.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 15.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import Common
import CommonUI

class InfoCell: UITableViewCell {
    
    /*
     public
     internal
     private
     
     override
     func
     private
     */
    
    // MARK: - Constants
    
    private enum Constants {
        static let backgroundColor: UIColor = UIColor(red: 1, green: 0.983, blue: 0.96, alpha: 1)
        
        enum ShadowView {
            static let shadowColor: CGColor = UIColor(red: 0.521, green: 0.325, blue: 0.031, alpha: 0.06).cgColor
            static let shadowOffset: CGSize = CGSize(width: 0, height: 2)
            static let shadowOpacity: Float = 1.0
            static let shadowRadius: CGFloat = 6.0
        }
        
        enum ContainerView {
            static let cornerRadius: CGFloat = 32.0
        }
        
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
            #warning("изменить параметры на десятичные дроби")
            static let backgroundColor: UIColor = UIColor(red: 235/255, green: 109/255, blue: 77/255, alpha: 1)
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
        imageView.image = CommonUIAsset.avatar.image
        imageView.layer.borderWidth = Constants.AvatarImageView.borderWidth
        imageView.layer.borderColor = UIColor.systemGray5.cgColor
        imageView.layer.cornerRadius = Constants.AvatarImageView.cornerRadius
        return imageView
    }()

    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: CustomFontName.regular, size: Constants.LocationLabel.fontSize)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = Constants.LocationLabel.numberOfLines
        label.textColor = Constants.LocationLabel.textColor
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: CustomFontName.medium, size: Constants.NameLabel.fontSize)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = Constants.NameLabel.numberOfLines
        label.textColor = .black
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = Constants.ContainerView.cornerRadius
        return view
    }()
    
    private let editButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.EditButton.backgroundColor
        button.layer.cornerRadius = Constants.EditButton.cornerRadius
        button.setTitle(Constants.EditButton.title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: CustomFontName.medium, size: Constants.EditButton.fontSize)
        return button
    }()
    
    private let locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = CommonUIAsset.location.image
        return imageView
    }()
    
    private let shadowView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        view.layer.shadowColor = Constants.ShadowView.shadowColor
        view.layer.shadowOffset = Constants.ShadowView.shadowOffset
        view.layer.shadowOpacity = Constants.ShadowView.shadowOpacity
        view.layer.shadowRadius = Constants.ShadowView.shadowRadius
        return view
    }()
    
    // MARK: - Override functions
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = Constants.backgroundColor
        
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupContraints() {
        setupShadowViewContraints()
        setupContainerViewConstraints()
        setupAvatarImageViewConstraints()
        setupNameLabelConstraints()
        setupLocationImageViewConstraints()
        setupLocationLabelConstraints()
        setupEditButtonConstraints()
    }
    
    private func setupShadowViewContraints() {
        contentView.addSubview(shadowView)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupContainerViewConstraints() {
        shadowView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: shadowView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor)
        ])
    }

    private func setupAvatarImageViewConstraints() {
        containerView.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.AvatarImageView.leadingAnchorConstant),
            avatarImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.AvatarImageView.heightAnchorConstant),
            avatarImageView.widthAnchor.constraint(equalToConstant: Constants.AvatarImageView.widthAnchorConstant)
        ])
    }

    private func setupNameLabelConstraints() {
        containerView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.NameLabel.topAnchorConstant),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.NameLabel.leadingAnchorConstant),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constants.NameLabel.trailingAnchorConstant),
        ])
    }

    private func setupLocationImageViewConstraints() {
        containerView.addSubview(locationImageView)
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationImageView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            locationImageView.heightAnchor.constraint(equalToConstant: Constants.LocationImageView.heightAnchorConstant),
            locationImageView.widthAnchor.constraint(equalToConstant: Constants.LocationImageView.widthAnchorConstant)
        ])
    }

    private func setupLocationLabelConstraints() {
        containerView.addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.LocationLabel.topAnchorConstant),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: Constants.LocationLabel.leadingAnchorConstant),
            locationLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constants.LocationLabel.trailingAnchorConstant),
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor)
        ])
    }

    private func setupEditButtonConstraints() {
        containerView.addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: Constants.EditButton.topAnchorConstant),
            editButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.EditButton.bottomAnchorConstant),
            editButton.leadingAnchor.constraint(equalTo: locationImageView.leadingAnchor),
            editButton.widthAnchor.constraint(equalToConstant: Constants.EditButton.widthAnchorConstant),
            editButton.heightAnchor.constraint(equalToConstant: Constants.EditButton.heightAnchorConstant)
        ])
    }
}
