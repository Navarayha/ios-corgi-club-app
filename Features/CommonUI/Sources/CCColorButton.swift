//
//  CCColorButton.swift
//  CommonUI
//
//  Created by Mikhail Chuparnov on 23.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

public class CCColorButton: UIButton {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        
        self.backgroundColor = UIColor(named: "color", in: CommonUIResources.bundle, compatibleWith: nil)
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.buttonFontSize.nextUp)
        self.layer.cornerRadius = 14
        self.layer.masksToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
