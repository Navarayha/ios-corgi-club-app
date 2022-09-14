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
    
}
