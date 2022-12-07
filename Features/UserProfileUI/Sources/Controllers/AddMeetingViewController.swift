//
//  AddMeetingViewController.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 07.12.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

class AddMeetingViewController: UIViewController {
    
    // MARK: - Override functions

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        
        let label = UILabel()
        label.text = "Add Meeting View Controller"
        label.font = UIFont.systemFont(ofSize: 25)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
