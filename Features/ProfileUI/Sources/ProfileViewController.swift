//
//  ViewController.swift
//  CorgiClubApp
//
//  Created by Afir Thes on 02.09.2022.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit
import Common

public class ProfileViewController: UIViewController {

    var viewFeedButton = UIButton()

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Util.doStuff())
        view.backgroundColor = .systemYellow

        configureButton()
    }
    
    func configureButton() {
        view.addSubview(viewFeedButton)
        viewFeedButton.setTitle("View random feed", for: .normal)
        viewFeedButton.addTarget(self, action: #selector(viewFeedAction), for: .touchUpInside)
        viewFeedButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewFeedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewFeedButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewFeedButton.heightAnchor.constraint(equalToConstant: 44)
            //viewFeed.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    @objc func viewFeedAction() {
        //delegate.doLogin()
    }
    

}
