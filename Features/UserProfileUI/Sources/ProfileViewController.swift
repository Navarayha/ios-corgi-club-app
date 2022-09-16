//
//  ViewController.swift
//  CorgiClubApp
//
//  Created by Afir Thes on 02.09.2022.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit
import Common

public class UserProfileUIViewController: UIViewController {

    let infoView = InfoView()
    let userPetsCollectionView = UserPetsCollectionView()

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupConfig()
        setupConstraints()
        
        userPetsCollectionView.addPet(userPets: UserPetsModel.fetchUserPets())
        
        title = Title.profileID.rawValue
    }
    
    private func setupConfig() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pencil"), style: .plain, target: self, action: #selector(editProfile))
    }
    
    private func setupConstraints() {
        
        view.addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            infoView.heightAnchor.constraint(equalToConstant: 300),
            infoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(userPetsCollectionView)
        userPetsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userPetsCollectionView.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 5),
            userPetsCollectionView.heightAnchor.constraint(equalToConstant: 80),
            userPetsCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userPetsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userPetsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
    

    @objc private func editProfile() {
        print("Edit profile")
    }

}
