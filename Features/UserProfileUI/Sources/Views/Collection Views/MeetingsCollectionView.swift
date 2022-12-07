//
//  MeetingsCollectionView.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 25.11.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import Common

class MeetingsCollectionView: UICollectionView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let insetForSectionAt: UIEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        static let minimumLineSpacingForSectionAt: CGFloat = 20.0
        static let sizeForItemAt: CGSize = CGSize(width: 60, height: 80)
    }
    
    // MARK: - Override functions
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        registerCell(MeetingsCollectionViewCell.self)
        registerCell(AddItemCollectionViewCell.self)

        dataSource = self
        delegate = self
                    
        showsHorizontalScrollIndicator = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func configureMeetingsCollectionViewCell(indexPath: IndexPath) -> MeetingsCollectionViewCell {
        let cell = self.dequeueReusableCell(forIndexPath: indexPath) as MeetingsCollectionViewCell
        
        cell.monthLabel.text = datesData[indexPath.item].month
        cell.numberLabel.text = String(describing: datesData[indexPath.item].number)
        
        return cell
    }
    
    private func configureAddItemCollectionViewCell(indexPath: IndexPath) -> AddItemCollectionViewCell {
        let cell = self.dequeueReusableCell(forIndexPath: indexPath) as AddItemCollectionViewCell
        
        return cell
    }
}

    // MARK: - UICollectionViewDataSource

extension MeetingsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datesData.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellID = indexPath.item < datesData.count ? MeetingsCollectionViewCell.reuseID : AddItemCollectionViewCell.reuseID

        switch cellID {
        case MeetingsCollectionViewCell.reuseID:
            return configureMeetingsCollectionViewCell(indexPath: indexPath)
        case AddItemCollectionViewCell.reuseID:
            return configureAddItemCollectionViewCell(indexPath: indexPath)
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = UIApplication.getTopMostViewController()

        if indexPath.item == datesData.count {
            let destinationVC = AddMeetingViewController()
            destinationVC.modalPresentationStyle = .automatic
            vc?.present(destinationVC, animated: true)
        } else {
            let destinationVC = MeetingViewController()
            destinationVC.modalPresentationStyle = .automatic
            vc?.present(destinationVC, animated: true)
        }
    }
}

    // MARK: - UICollectionViewDelegateFlowLayout

extension MeetingsCollectionView: UICollectionViewDelegateFlowLayout {
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
