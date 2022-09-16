//
//  TabBarController.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 15.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

public class TabBarController: UITabBarController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .systemBackground
        
        let userProfileUIVC = UserProfileUIViewController()
        
        #warning("Заменить force unwrapping для image")
        viewControllers = [
            createViewController(rootViewController: userProfileUIVC, title: "Profile", image: UIImage(systemName: "person")!)
        ]
    }
    
    private func createViewController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        navigationVC.navigationBar.backgroundColor = .systemBackground
        return navigationVC
    }
}
