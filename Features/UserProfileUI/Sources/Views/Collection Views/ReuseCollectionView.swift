//
//  ReuseCollectionView.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 07.12.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

//import UIKit

#warning("Доработать")
//
//class ReuseCollectionView: UICollectionView {
//
//    // MARK: - Properties
//
//    private var cell: UICollectionViewCell? = nil
//    private var cellType: UICollectionViewCell.Type? = nil
//
//    private var data: [Any] = []
//
//    private var destinationVCs: [UIViewController]?
//
//    // MARK: - Override functions
//
//    init(frame: CGRect, data: [Any], cellType: UICollectionViewCell.Type, cell: UICollectionViewCell, destinationVCs: [UIViewController]? = nil) {
//
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//
//        super.init(frame: .zero, collectionViewLayout: layout)
//
//        self.cell = cell
//        self.cellType = cellType
//        self.data = data
//        self.destinationVCs = destinationVCs
//
//        registerCell(cellType)
//
//        showsHorizontalScrollIndicator = false
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    // MARK: - Functions
//
////    func configureCustomCollectionViewCell(indexPath: IndexPath, cell: UICollectionViewCell) -> UICollectionViewCell {
////        let type = cellType
////        let cell = self.dequeueReusableCell(forIndexPath: indexPath) as
////
////
////        return cell
////    }
//
//    func configCell(cell: UICollectionViewCell) {
//
//    }
//
//    private func configureAddItemCollectionViewCell(indexPath: IndexPath) -> AddItemCollectionViewCell {
//        let cell = self.dequeueReusableCell(forIndexPath: indexPath) as AddItemCollectionViewCell
//
//        return cell
//    }
//}
//
//    // MARK: - UICollectionViewDataSource
//
//extension ReuseCollectionView: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return data.count + 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cellID = indexPath.row < petsData.count ? cellType?.reuseID : AddItemCollectionViewCell.reuseID
//
//        switch cellID {
//        case cellType?.reuseID:
//
//            let cell = self.dequeueReusableCell(forIndexPath: indexPath) as PetsCollectionViewCell
//
//            return cell
////            return configureCustomCollectionViewCell(indexPath: indexPath, cell: cellType)
//        case AddItemCollectionViewCell.reuseID:
//            return configureAddItemCollectionViewCell(indexPath: indexPath)
//        default:
//            return UICollectionViewCell()
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
////        let vc = UIApplication.getTopMostViewController()
//
//        if indexPath.row == data.count {
////            let destinationVC = AddPetViewController()
////            destinationVC.modalPresentationStyle = .automatic
////            vc?.present(destinationVC, animated: true)
//            print("Next Controller")
//        } else {
////            let destinationVC = PetProfileViewController()
////            destinationVC.modalPresentationStyle = .automatic
////            vc?.present(destinationVC, animated: true)
//            print("Add Controller")
//        }
//    }
//}
//
//    // MARK: - UICollectionViewDelegateFlowLayout
//
//extension ReuseCollectionView: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 60, height: 80)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
//    }
//}
