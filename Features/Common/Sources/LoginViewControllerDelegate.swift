//
//  AuthService.swift
//  Common
//
//  Created by Afir Thes on 02.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import Foundation

public protocol LoginViewControllerDelegate: AnyObject {
    func doLogin(mail: String, password: String)
}
