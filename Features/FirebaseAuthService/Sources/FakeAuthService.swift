//
//  AuthService.swift
//  AuthService
//
//  Created by Afir Thes on 02.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import Foundation
import Common

public class FakeAuthService: AuthService {

    
    public func login(login: String, password: String) -> Bool {
        print("you are loggedin")
        return true
    }
    
    public func isLoginned() -> Bool {
        print("yes you are!")
        return true
    }
    
    private init() { }
    
    
}
