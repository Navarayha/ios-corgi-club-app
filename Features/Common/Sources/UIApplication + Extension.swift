//
//  UIApplication + Extension.swift
//  Common
//
//  Created by Микаэл Мартиросян on 07.12.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

#warning("Разобраться в коде")
extension UIApplication {

    class public func getTopMostViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        } else {
            return nil
        }
    }
}
