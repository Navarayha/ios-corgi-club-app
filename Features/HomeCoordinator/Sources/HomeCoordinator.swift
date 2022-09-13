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
   
    
    var loginVC = LoginViewController()
    var navVC = UINavigationController(rootViewController: LoginViewController())
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
        vc.navigationController?.navigationBar.isHidden = true
        vc.navigationController?.pushViewController(feedVC, animated: true)
    }

    
}
