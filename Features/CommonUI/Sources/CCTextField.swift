//
//  CCTextField.swift
//  CommonUI
//
//  Created by Mikhail Chuparnov on 23.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

class CCTextField: UITextField {
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 2))
        self.leftView = leftView
        self.leftViewMode = .always
        self.autocapitalizationType = .none
        self.tintColor = .black
        self.textColor = .black
        self.adjustsFontForContentSizeCategory = true
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 3
        translatesAutoresizingMaskIntoConstraints = false
    }
}
