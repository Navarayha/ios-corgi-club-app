//
//  CommonUICreateFormTextField.swift
//  CommonUI
//
//  Created by Микаэл Мартиросян on 11.12.2022.
//  Copyright © 2022 CoffeAndCode.org. All rights reserved.
//

import UIKit

public class CommonUICreateFormTextField: UITextField {
    
    // MARK: - Constants
    
    private enum Constants {
        static let borderColor: CGColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
        static let borderWidth: CGFloat = 1.0
        static let cornerRadius: CGFloat = 8.0
        static let fontSize: CGFloat = 16.0
        static let leftViewFrame: CGRect = CGRect(x: 0, y: 0, width: 16, height: 49)
        static let textColor: UIColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
        
        static let heightAncor: CGFloat = 49.0
    }
    
    // MARK: - Override functions
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        textFieldConfiguration()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.borderColor = Constants.borderColor
        layer.borderWidth = Constants.borderWidth
        layer.cornerRadius = CommonUIConstants.View.smallCornerRaduis
    }
    
    // MARK: - Functions
    
    private func textFieldConfiguration() {
        autocapitalizationType = .sentences
        font = CommonUIFontFamily.Montserrat.medium.font(size: Constants.fontSize)
        
        leftView = UIView(frame: Constants.leftViewFrame)
        leftViewMode = .always
        textAlignment = .left
        textColor = .black
        
        #warning("Добавить переход на следующий textField")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Constants.heightAncor)
        ])
    }
}
