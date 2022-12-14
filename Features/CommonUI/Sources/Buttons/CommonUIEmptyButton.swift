//
//  CommonUICancelButton.swift
//  CommonUI
//
//  Created by Микаэл Мартиросян on 11.12.2022.
//  Copyright © 2022 CoffeAndCode.org. All rights reserved.
//

import UIKit

public class CommonUIEmptyButton: UIButton {
    
    // MARK: - Constants
    
    private enum Constants {
        static let borderColor: CGColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        static let borderWidth: CGFloat = 1.0
        static let fontSize: CGFloat = 18.0
//        static let title: String = "Отмена"
        
        static let height: CGFloat = 48.0
        static let width: CGFloat = 150.0
    }
    
    // MARK: - Override functions
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        butonConfiguration()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.borderColor = Constants.borderColor
        layer.borderWidth = Constants.borderWidth
        layer.cornerRadius = createCornerRadius()
    }
    
    // MARK: - Functions
    
    private func butonConfiguration() {
        backgroundColor = .white
        setTitleColor(.black, for: .normal)
        titleLabel?.font = CommonUIFontFamily.Inter.medium.font(size: Constants.fontSize)
    }
    
    private func setConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Constants.height),
            widthAnchor.constraint(equalToConstant: Constants.width)
        ])
    }
}
