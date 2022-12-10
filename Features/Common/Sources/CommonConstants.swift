//
//  Constants.swift
//  Common
//
//  Created by Микаэл Мартиросян on 06.12.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

public enum CommonConstants {
    
    public enum View {
        public static let backgroundColor: UIColor = UIColor(red: 1, green: 0.983, blue: 0.96, alpha: 1)
        public static let bigCornerRadius: CGFloat = 32.0
        public static let smallCornerRaduis: CGFloat = 16.0
        
        public enum Separator {
            public static let backgroundColor: UIColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
        }
        
        public enum Shadow {
            public static let shadowColor: CGColor = UIColor(red: 0.521, green: 0.325, blue: 0.031, alpha: 0.06).cgColor
            public static let shadowOffset: CGSize = CGSize(width: 0, height: 2)
            public static let shadowOpacity: Float = 1.0
            public static let shadowRadius: CGFloat = 6.0
        }
    }
}
