//
//  CCTextField.swift
//  CommonUI
//
//  Created by Mikhail Chuparnov on 23.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

public class CCTextField: UITextField {
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(placeholder: String, isSecure: Bool, keyboardType: UIKeyboardType) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.isSecureTextEntry = isSecure
        self.keyboardType = keyboardType
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        self.backgroundColor = .systemGray6
        self.placeholder = placeholder
        self.font = UIFont.systemFont(ofSize: 16)
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 2))
        self.leftView = leftView
        self.leftViewMode = .always
        self.autocapitalizationType = .none
        self.tintColor = .black
        self.textColor = .black
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.clearButtonMode = .whileEditing
        self.clearButtonMode = .unlessEditing
        self.clearButtonMode = .always
        self.clipsToBounds = true
        self.layer.cornerRadius = 14
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
