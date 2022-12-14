//
//  CommonDateFormatterSingleton.swift
//  CommonUI
//
//  Created by Микаэл Мартиросян on 13.12.2022.
//  Copyright © 2022 CoffeAndCode.org. All rights reserved.
//

import Foundation

#warning("https://sarunw.com/posts/how-expensive-is-dateformatter/")
public class CommonDateFormatterSingleton {
    
    public static let shared = CommonDateFormatterSingleton()
    
    private init() {}
    
    public let dateFormatterOfDate: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter
    }()
    
    public let dateFormatterOfTime: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter
    }()
}
