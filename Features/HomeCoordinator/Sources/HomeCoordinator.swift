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

    public func doLogin(mail: String, password: String) {
        
        if authService.login(login: mail, password: password) {
            
            /* необходимо перенести выше
            
            Auth.auth().signIn(withEmail: loginView.text ?? "", password: passView.text ?? "") { [self] authResult, error in
      
                if authResult != nil && error == nil {
                    alert.title = authResult!.user.uid
                    self.present(alert, animated: true, completion: nil)
                    
                    
                } else if error != nil {
                    print(error!.localizedDescription)
                    alert.title = error?.localizedDescription
                    self.present(alert, animated: true, completion: nil)
                }
            }
             
            */
            
            
//            vc.navigationController?.navigationBar.isHidden = true
//            vc.navigationController?.pushViewController(feedVC, animated: true)
        } else {
            print("Login error")
        }
    }

    
}
