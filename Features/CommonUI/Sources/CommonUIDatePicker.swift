//
//  CommonUIDatePicker.swift
//  CommonUI
//
//  Created by Микаэл Мартиросян on 13.12.2022.
//  Copyright © 2022 CoffeAndCode.org. All rights reserved.
//

import UIKit

public class CommonUIDatePicker: UIDatePicker {
    
    // MARK: - Constants
    
    private enum Constants {
        static let borderColor: CGColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
        static let borderWidth: CGFloat = 1.0
        static let tintColor: UIColor = UIColor(red: 0.922, green: 0.427, blue: 0.302, alpha: 1)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        datePickerMode = .date
        minimumDate = .now
        preferredDatePickerStyle = .inline
        tintColor = Constants.tintColor
        
//        let additionalView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 44))
//        additionalView.backgroundColor = .red
//        self.inputAccessoryView = additionalView
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
}
