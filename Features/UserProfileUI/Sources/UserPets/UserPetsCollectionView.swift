//
//  UserPetsCollectionVC.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 15.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

class UserPetsCollectionView: UICollectionView {
    
    let petsAvatar = [UIImage(systemName: "person")!, UIImage(systemName: "person")!, UIImage(systemName: "person")!]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UserPetsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
