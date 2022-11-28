//
//  DescriptionCell.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 17.10.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import Common

class DescriptionCell: UITableViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        enum TitleLabel {
            static let fontSize: CGFloat = 25.0
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
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: CustomFontName.medium, size: Constants.TitleLabel.fontSize)
        label.text = Constants.TitleLabel.text
        label.textColor = .black
        return label
    }()
    
#warning ("Убрать заглушку")
    let aboutLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: CustomFontName.regular, size: Constants.AboutLabel.fontSize)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = Constants.AboutLabel.numberOfLines
        label.text = "27 лет, программист, люблю корги и путешествовать"
        label.textColor = .black
        return label
    }()
    
    // MARK: - Override functions

    private override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        setupTitleLabelConstraints()
        setupAboutLabelConstraints()
    }
    
    private func setupTitleLabelConstraints() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.TitleLabel.topAnchorConstant),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.TitleLabel.leadingAnchorConstant),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.TitleLabel.heightAnchorConstant)
        ])
    }
    
    private func setupAboutLabelConstraints() {
        contentView.addSubview(aboutLabel)
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.AboutLabel.topAnchorConstant),
            aboutLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.AboutLabel.bottomAnchorConstant),
            aboutLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.AboutLabel.leadingAnchorConstant),
            aboutLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.AboutLabel.trailingAnchorConstant)
        ])
    }
}
