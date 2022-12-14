//
//  CommonUICreateButton.swift
//  CommonUI
//
//  Created by Микаэл Мартиросян on 11.12.2022.
//  Copyright © 2022 CoffeAndCode.org. All rights reserved.
//

import UIKit

public class CommonUIFilledButton: UIButton {
    
    // MARK: - Constants
    
    private enum Constants {
        static let fontSize: CGFloat = 18.0
        static let title: String = "Создать"
        
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
        
        layer.cornerRadius = createCornerRadius()
    }
    
    // MARK: - Functions
    
    private func butonConfiguration() {
        backgroundColor = CommonUIAsset.buttonsBackgroundColor.color
        setTitle(Constants.title, for: .normal)
        setTitleColor(.white, for: .normal)
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
