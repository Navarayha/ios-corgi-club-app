//
//  ViewController.swift
//  CorgiClubApp
//
//  Created by Afir Thes on 02.09.2022.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit
import Common
import LoginUI
import FeedUI
import AuthService

public class HomeCoordinator: LoginViewControllerDelegate {
   
    var authService: AuthService!
    var loginVC = LoginViewController()
    var navVC = UINavigationController(rootViewController: LoginViewController())
    var feedVC = FeedViewController()
    
    public init(authService: AuthService) {
        self.authService = authService
    }
    
    
    public func configureLoginVC() -> LoginViewController {
        loginVC.delegate = self
        return loginVC
    }
    
    public func configureFeedVC() {
        
    }

    func doLogin(mail: String, password: String) {
        
        if authService.login(login: mail, password: password) {
            vc.navigationController?.navigationBar.isHidden = true
            vc.navigationController?.pushViewController(feedVC, animated: true)
        } else {
            print("Login error")
        }
    }

    
}
