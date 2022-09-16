//
//  UserPetsCollectionView.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 15.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

class UserPetsCollectionView: UICollectionView {
    
    var userPets = [UserPetsModel]()
    
    var addPetButton: UIButton = {
        let button = UIButton()
        button.imageView?.image = UIImage(systemName: "plus")
        button.tintColor = .orange
        return button
    }()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
        
        register(UserPetsCell.self, forCellWithReuseIdentifier: UserPetsCell.reuseID)
        
        showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addPet(userPets: [UserPetsModel]) {
        self.userPets = userPets
    }
    
}

extension UserPetsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserPetsCell.reuseID, for: indexPath) as! UserPetsCell
        cell.petAvatar.image = userPets[indexPath.item].avatar
        cell.petName.text = userPets[indexPath.item].name
        
        return cell
    }
}

extension UserPetsCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 80)
    }
    
}
