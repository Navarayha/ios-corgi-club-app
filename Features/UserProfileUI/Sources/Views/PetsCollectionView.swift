//
//  PetsCollectionView.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 15.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import Common

#warning("Переиспользовать")

//protocol AddButtonProtocol {
//    func addButtonTapped(sender: UIButton)
//}

class PetsCollectionView: UICollectionView {
    
    // MARK: - Properties
    
//    var addButtonDelegate: AddButtonProtocol?
    
    let test = UserProfileViewController()
//    let delegateTest: UserProfileUIViewController?
    
    // MARK: - Override functions
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        registerCell(PetsCollectionViewCell.self)
        registerCell(AddButtonCollectionViewCell.self)

        dataSource = self
        delegate = self
                    
        showsHorizontalScrollIndicator = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupCell(cell: UICollectionViewCell, indexPath: IndexPath, type: String) {
        switch(type) {
        case PetsCollectionViewCell.reuseID:
            setupUserPetsCell(cell: cell as! PetsCollectionViewCell, indexPath: indexPath)
        case AddButtonCollectionViewCell.reuseID:
            setupAddButtonCell(cell: cell as! AddButtonCollectionViewCell, indexPath: indexPath)
        default:
            break
        }
    }
    
    private func setupUserPetsCell(cell: PetsCollectionViewCell, indexPath: IndexPath) {
        cell.avatarImageView.image = petsData[indexPath.row].avatar
        cell.nameLabel.text = petsData[indexPath.row].name
    }
    
    private func setupAddButtonCell(cell: AddButtonCollectionViewCell, indexPath: IndexPath) {
        cell.plusButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc func addButtonTapped() {
//        test.addButtonTapped()
        test.navigationController?.pushViewController(PetProfileViewController(), animated: true)
//        guard let delegateOne = delegateTest else {return}
//        delegateOne.addButtonTapped()
        print("ADD")
    }
}

    // MARK: - UICollectionViewDataSource

extension PetsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return petsData.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellID = indexPath.row < petsData.count ? PetsCollectionViewCell.reuseID : AddButtonCollectionViewCell.reuseID //"PetsCollectionViewCell" : "AddButtonCollectionViewCell"

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)

        setupCell(cell: cell, indexPath: indexPath, type: cellID)
        
        return cell
    }
}

    // MARK: - UICollectionViewDelegateFlowLayout

extension PetsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 80)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

//extension UserPetsCollectionView: AddButtonProtocol {
//
//}
