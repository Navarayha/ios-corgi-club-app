//
//  MeetingsCollectionViewCell.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 25.11.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import Common
import CommonUI

class MeetingsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        enum DateImageView {
            static let backgroundColor: UIColor = .init(red: 0.971, green: 1, blue: 0.961, alpha: 1)
            static let borderColor: CGColor = .init(red: 1, green: 0.871, blue: 0.678, alpha: 1)
            
            static let heightAnchorConstant: CGFloat = 60.0
            static let widthAnchorConstant: CGFloat = 60.0
        }

        enum MonthLabel {
            static let fontSize: CGFloat = 16.0
            static let textColor: UIColor = .init(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
            
            static let topAnchorConstant: CGFloat = 7.5
        }
        
        enum NumberLabel {
            static let fontSize: CGFloat = 18.0
            static let textColor: UIColor = .init(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)
            
            static let topAnchorConstant: CGFloat = 4.0
            static let bottomAnchorConstant: CGFloat = -7.5
        }
    }
    
    // MARK: - Properties
        
    let dateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = Constants.DateImageView.backgroundColor
        imageView.layer.borderColor = Constants.DateImageView.borderColor
        imageView.layer.borderWidth = 1.0
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: CustomFontName.regular, size: Constants.MonthLabel.fontSize)
        label.textAlignment = .center
        label.textColor = Constants.MonthLabel.textColor
        return label
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: CustomFontName.medium, size: Constants.NumberLabel.fontSize)
        label.textAlignment = .center
        label.textColor = Constants.NumberLabel.textColor
        return label
    }()
    
    // MARK: - Override functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
        
        dateImageView.layer.cornerRadius =  Constants.DateImageView.heightAnchorConstant / 2.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        dateImageView.image = nil
        monthLabel.text = nil
        numberLabel.text = nil
    }
    
    // MARK: - Functions
    
    private func setupConstraints() {
        dateImageViewConstraints()
        monthLabelConstraints()
        numberLabelConstraints()
    }
    
    private func dateImageViewConstraints() {
        contentView.addSubview(dateImageView)
        dateImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            dateImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dateImageView.heightAnchor.constraint(equalToConstant: Constants.DateImageView.heightAnchorConstant),
            dateImageView.widthAnchor.constraint(equalToConstant: Constants.DateImageView.widthAnchorConstant),
        ])
    }
    
    private func monthLabelConstraints() {
        dateImageView.addSubview(monthLabel)
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            monthLabel.topAnchor.constraint(equalTo: dateImageView.topAnchor, constant: Constants.MonthLabel.topAnchorConstant),
            monthLabel.centerXAnchor.constraint(equalTo: dateImageView.centerXAnchor)
        ])
    }
    
    private func numberLabelConstraints() {
        dateImageView.addSubview(numberLabel)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: Constants.MonthLabel.topAnchorConstant),
            numberLabel.bottomAnchor.constraint(equalTo: dateImageView.bottomAnchor, constant: Constants.NumberLabel.bottomAnchorConstant),
            numberLabel.centerXAnchor.constraint(equalTo: dateImageView.centerXAnchor)
        ])
    }
}
