//
//  CommonUIBackButton.swift
//  CommonUI
//
//  Created by Микаэл Мартиросян on 11.12.2022.
//  Copyright © 2022 CoffeAndCode.org. All rights reserved.
//

import UIKit

public class CommonUIBackButton: UIButton {
    
    // MARK: - Override functions
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        buttonConfigurations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func buttonConfigurations() {
        setImage(CommonUIAsset.arrow.image, for: .normal)
    }
}
