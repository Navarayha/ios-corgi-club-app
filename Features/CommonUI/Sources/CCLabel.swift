//
//  CCLabel.swift
//  CommonUI
//
//  Created by Mikhail Chuparnov on 23.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

class CCLabel: UILabel {
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(title: String) {
        super.init(frame: .zero)
        self.text = title
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        self.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
