//
//  CommonViews.swift
//  CorgiClubApp
//
//  Created by Mikhail Chuparnov on 14.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

public class CommonViews {
    
    public static func createColorButtonView(title: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "color", in: CommonUIResources.bundle, compatibleWith: nil)
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 14
        button.layer.masksToBounds = true
//        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    public static func createTextFieldView(placeholder: String, isSecure: Bool) -> UITextField {
        let text = UITextField()
        text.backgroundColor = .systemGray6
        text.placeholder = placeholder
        text.font = UIFont.systemFont(ofSize: 16)
        text.keyboardType = UIKeyboardType.emailAddress
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 2))
        text.leftView = leftView
        text.leftViewMode = .always
        text.autocapitalizationType = .none
        text.tintColor = .black
        text.textColor = .black
        text.layer.borderWidth = 0.5
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.clearButtonMode = .whileEditing
        text.clearButtonMode = .unlessEditing
        text.clearButtonMode = .always
        text.clipsToBounds = true
        text.layer.cornerRadius = 14
        text.isSecureTextEntry = isSecure
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }
    
    
    
}
