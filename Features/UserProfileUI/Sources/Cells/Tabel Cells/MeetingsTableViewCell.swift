//
//  MeetingsTableViewCell.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 25.11.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import Common

class MeetingsTableViewCell: UITableViewCell {

    // MARK: - Constants
    
    private enum Constants {
        static let backgroundColor: UIColor = UIColor(red: 1, green: 0.983, blue: 0.96, alpha: 1)
        static let minimumLineSpacingForSection: CGFloat = 20.0
        
        enum ShadowView {
            static let shadowColor: CGColor = UIColor(red: 0.521, green: 0.325, blue: 0.031, alpha: 0.06).cgColor
            static let shadowOffset: CGSize = CGSize(width: 0, height: 2)
            static let shadowOpacity: Float = 1.0
            static let shadowRadius: CGFloat = 6.0
        }
        
        enum ContainerView {
            static let cornerRadius: CGFloat = 32.0
        }
        
        enum TitleLabel {
            static let fontSize: CGFloat = 18.0
            static let text: String = "Мои встречи"
                        
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
    
    private let collectionView = MeetingsCollectionView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: CustomFontName.medium, size: Constants.TitleLabel.fontSize)
        label.text = Constants.TitleLabel.text
        label.textColor = .black
        return label
    }()
    
    private let shadowView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.blue.cgColor //Constants.ShadowView.shadowColor
        view.layer.shadowOffset = Constants.ShadowView.shadowOffset
        view.layer.shadowOpacity = Constants.ShadowView.shadowOpacity
        #warning("добавить shadowPath")
        view.layer.shadowRadius = Constants.ShadowView.shadowRadius
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        
        var bottomLeftCornerMask = CACornerMask()
        bottomLeftCornerMask.insert(.layerMinXMaxYCorner)
        
        var bottomRightCornerMask = CACornerMask()
        bottomRightCornerMask.insert(.layerMaxXMaxYCorner)
        
        view.layer.cornerRadius = Constants.ContainerView.cornerRadius
        view.layer.maskedCorners = [bottomLeftCornerMask, bottomRightCornerMask]
        
        view.backgroundColor = .white
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
        setupContainerViewContraints()
        setupTitleLabelContraints()
        setupCollectionViewContraints()
    }
    
    private func setupShadowViewContraints() {
        contentView.addSubview(shadowView)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: contentView.topAnchor),
            shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupContainerViewContraints() {
        shadowView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: shadowView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
        ])
    }
    
    private func setupTitleLabelContraints() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.TitleLabel.topAnchorConstant),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.TitleLabel.leadingAnchorConstant),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.TitleLabel.heightAnchorConstant),
        ])
    }
    
    private func setupCollectionViewContraints() {
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.CollectionView.topAnchorConstant),
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.CollectionView.bottomAnchorConstant),
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: Constants.CollectionView.heightAnchorConstant)
        ])
    }
    
}
