//
//  CommonUICreateFormLabel.swift
//  CommonUI
//
//  Created by Микаэл Мартиросян on 13.12.2022.
//  Copyright © 2022 CoffeAndCode.org. All rights reserved.
//

import UIKit

public class CommonUICreateFormLabel: PaddingLabel {
    
    // MARK: - Constants
    
    private enum Constants {
        static let borderColor: CGColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
        static let borderWidth: CGFloat = 1.0
        static let cornerRadius: CGFloat = CommonUIConstants.View.smallCornerRaduis
        static let fontSize: CGFloat = 16.0
        static let heightAnchor: CGFloat = 49.0
        static let paddingLeft: CGFloat = 16.0
        static let textColor: UIColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        font = CommonUIFontFamily.Montserrat.medium.font(size: Constants.fontSize)
        heightAnchor.constraint(equalToConstant: Constants.heightAnchor).isActive = true
        isUserInteractionEnabled = true
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = Constants.borderColor
        layer.cornerRadius = Constants.cornerRadius
        paddingLeft = Constants.paddingLeft
        textAlignment = .left
        textColor = Constants.textColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
