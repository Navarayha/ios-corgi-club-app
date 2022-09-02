//
//  ViewController.swift
//  CorgiClubApp
//
//  Created by Afir Thes on 02.09.2022.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit
import Common


public protocol LoginDelegate {
    func doLogin(vc: UIViewController)
}

public class LoginViewController: UIViewController {
    
    public var delegate: LoginDelegate!
    
    var loginButton = UIButton()

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Util.doStuff())
        view.backgroundColor = .systemGreen

        configureButton()
    }
    
    func configureButton() {
        view.addSubview(loginButton)
        loginButton.setTitle("LOGIN", for: .normal)
        loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        loginButton.backgroundColor = .systemPink
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            loginButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    @objc func loginPressed() {
        delegate.doLogin(vc: self)
    }
    

}
