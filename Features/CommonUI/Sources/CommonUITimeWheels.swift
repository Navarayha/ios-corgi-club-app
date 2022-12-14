//
//  CommonUITimeWheels.swift
//  CommonUI
//
//  Created by Микаэл Мартиросян on 14.12.2022.
//  Copyright © 2022 CoffeAndCode.org. All rights reserved.
//

import UIKit

public class CommonUITimeWheels: UIDatePicker {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        datePickerMode = .time
        locale = .init(components: Locale.Components(languageCode: "ru-RU"))
        preferredDatePickerStyle = .wheels
        timeZone = .current
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
