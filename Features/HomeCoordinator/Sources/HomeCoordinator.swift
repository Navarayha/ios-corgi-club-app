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
import UserProfileUI

public class HomeCoordinator: LoginDelegate {
   

    var loginVC = LoginViewController()
    
    var feedVC = FeedViewController()
    
    public init() {
        
    }
    
    
    public func configureLoginVC() -> LoginViewController {
        loginVC.delegate = self
        return loginVC
    }
    
    public func configureFeedVC() {
        
    }
    
    public func doLogin(vc: UIViewController) {
        //vc.present(feedVC, animated: true)
        
        if FirebaseAuthService.instance.login(login: "1", password: "2") {
            let appDelegate = UIApplication.shared.delegate
            guard let window = appDelegate?.window else { return }
            window?.rootViewController = TabBarController()
        } else {
            print("wrong pass")
        }

    }
    
}
