//
//  PetsCollectionView.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 15.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import Common

class PetsCollectionView: UICollectionView {
    
    // MARK: - Constants
        
    private enum Constants {
        static let insetForSectionAt: UIEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        static let minimumLineSpacingForSectionAt: CGFloat = 20.0
        static let sizeForItemAt: CGSize = CGSize(width: 60, height: 80)
    }
    
    private var petDelegate: PetControllerDelegate
    
    // MARK: - Override functions
    
    init(frame: CGRect, petDelegate: PetControllerDelegate) {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        self.petDelegate = petDelegate
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        registerCell(PetsCollectionViewCell.self)
        registerCell(AddItemCollectionViewCell.self)

        dataSource = self
        delegate = self
        
        showsHorizontalScrollIndicator = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func configurePetsCollectionViewCell(indexPath: IndexPath) -> PetsCollectionViewCell {
        let cell = self.dequeueReusableCell(forIndexPath: indexPath) as PetsCollectionViewCell
        
        cell.avatarImageView.image = petsData[indexPath.item].avatar
        cell.nameLabel.text = petsData[indexPath.item].name
        
        return cell
    }
    
    private func configureAddItemCollectionViewCell(indexPath: IndexPath) -> AddItemCollectionViewCell {
        let cell = self.dequeueReusableCell(forIndexPath: indexPath) as AddItemCollectionViewCell
        
        return cell
    }
}

    // MARK: - UICollectionViewDataSource

extension PetsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return petsData.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellID = indexPath.item < petsData.count ? PetsCollectionViewCell.reuseID : AddItemCollectionViewCell.reuseID

        switch cellID {
        case PetsCollectionViewCell.reuseID:
            return configurePetsCollectionViewCell(indexPath: indexPath)
        case AddItemCollectionViewCell.reuseID:
            return configureAddItemCollectionViewCell(indexPath: indexPath)
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if indexPath.row == petsData.count {
            petDelegate.addPet()
        } else {
            petDelegate.petSelected()
        }
    }
}

    // MARK: - UICollectionViewDelegateFlowLayout

extension PetsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Constants.sizeForItemAt
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.minimumLineSpacingForSectionAt
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Constants.insetForSectionAt
    }
}
