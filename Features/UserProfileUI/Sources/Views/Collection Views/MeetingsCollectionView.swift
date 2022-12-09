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
    
    // MARK: - Properties
    
    private var data: [MeetingDataStruct]? = nil
    private var meetingDelegate: MeetingControllerDelegate
    
    // MARK: - Override functions
    
    init(frame: CGRect, meetingDelegate: MeetingControllerDelegate) {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        self.meetingDelegate = meetingDelegate
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        registerCell(MeetingCollectionViewCell.self)
        registerCell(AddItemCollectionViewCell.self)

        dataSource = self
        delegate = self
                    
        showsHorizontalScrollIndicator = false
        
        fetchData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func configureMeetingsCollectionViewCell(indexPath: IndexPath) -> MeetingCollectionViewCell {
        let cell = self.dequeueReusableCell(forIndexPath: indexPath) as MeetingCollectionViewCell
        
        cell.monthLabel.text = data?[indexPath.item].month
        cell.numberLabel.text = String(describing: data?[indexPath.item].number)
        
        return cell
    }
    
    private func configureAddItemCollectionViewCell(indexPath: IndexPath) -> AddItemCollectionViewCell {
        let cell = self.dequeueReusableCell(forIndexPath: indexPath) as AddItemCollectionViewCell
        return cell
    }
    
    private func fetchData() {
        // Получить данные и присвоить их переменной data
    }
}

    // MARK: - UICollectionViewDataSource

extension MeetingsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (data?.count ?? Int.zero) + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellID = indexPath.item < (data?.count ?? Int.zero) ? MeetingCollectionViewCell.reuseID : AddItemCollectionViewCell.reuseID

        switch cellID {
        case MeetingCollectionViewCell.reuseID:
            return configureMeetingsCollectionViewCell(indexPath: indexPath)
        case AddItemCollectionViewCell.reuseID:
            return configureAddItemCollectionViewCell(indexPath: indexPath)
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if indexPath.item == data?.count {
            meetingDelegate.addMeeting()
        } else {
            meetingDelegate.meetingSelected()
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
