//
//  DescriptionView.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 06.12.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import Common
import CommonUI

class DescriptionView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        
        enum TitleLabel {
            static let text = "О себе"
            
            static let topAnchorConstant: CGFloat = 24.0
            static let leadingAnchorConstant: CGFloat = 16.0
            static let heightAnchorConstant: CGFloat = 22.0
        }
        
        enum AboutLabel {
            static let fontSize: CGFloat = 16.0
            static let numberOfLines: Int = 0
            
            static let topAnchorConstant: CGFloat = 16.0
            static let bottomAnchorConstant: CGFloat = -24.0
            static let leadingAnchorConstant: CGFloat = 16.0
            static let trailingAnchorConstant: CGFloat = -16.0
        }
    }
    
    // MARK: - Properties
    
    let aboutLabel: UILabel = {
        let label = UILabel()
        label.font = CommonUIFontFamily.Inter.regular.font(size: Constants.AboutLabel.fontSize)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = Constants.AboutLabel.numberOfLines
        label.textColor = .black
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = CommonUIFontFamily.Inter.medium.font(size: UserProfileUIConstants.Label.Title.fontSize)
        label.text = Constants.TitleLabel.text
        label.textColor = .black
        return label
    }()
    
    // MARK: - Override functions

    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.mask = makeMaskLayer()
    }
    
    // MARK: - Functions
    
    private func makeMaskLayer() -> CAShapeLayer {
        let radius = CommonConstants.View.cornerRadius
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: radius, height: radius)).cgPath
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath
        return maskLayer
    }
    
    private func setupConstraints() {
        setupTitleLabelConstraints()
        setupAboutLabelConstraints()
    }
    
    private func setupTitleLabelConstraints() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.TitleLabel.topAnchorConstant),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.TitleLabel.leadingAnchorConstant),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.TitleLabel.heightAnchorConstant)
        ])
    }
    
    private func setupAboutLabelConstraints() {
        addSubview(aboutLabel)
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.AboutLabel.topAnchorConstant),
            aboutLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.AboutLabel.bottomAnchorConstant),
            aboutLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.AboutLabel.leadingAnchorConstant),
            aboutLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.AboutLabel.trailingAnchorConstant)
        ])
    }
}
