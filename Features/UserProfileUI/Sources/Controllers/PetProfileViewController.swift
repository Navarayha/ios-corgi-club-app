//
//  PetProfileViewController.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 22.11.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

class PetProfileViewController: UIViewController {
    
    // MARK: - Override functions

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        
        let label = UILabel()
        label.text = "Pet Profile View Controller"
        label.font = UIFont.systemFont(ofSize: 25)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
