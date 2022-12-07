//
//  SeparatorView.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 06.12.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import Common

class SeparatorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = CommonConstants.View.Separator.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
