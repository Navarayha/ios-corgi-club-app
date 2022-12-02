//
//  UserProfileViewController.swift
//  UserProfileUI
//
//  Created by Afir Thes on 02.09.2022.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit
import Common

public class UserProfileViewController: UIViewController {

    // MARK: - Constants
    
    private enum Constants {
        static let backgroundColor: UIColor = UIColor(red: 1, green: 0.983, blue: 0.96, alpha: 1)
        static let cornerRadius: Double = 32.0
        static let numberOfSections: Int = 2
        
        enum NumberOfRowsInSection {
            static let one: Int = 1
            static let two: Int = 3
        }
    }
    
    // MARK: - Properties
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        
        tableView.backgroundColor = Constants.backgroundColor
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.separatorStyle = .none //.singleLine
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.registerCell(DescriptionCell.self)
        tableView.registerCell(InfoCell.self)
        tableView.registerCell(MeetingsTableViewCell.self)
        tableView.registerCell(PetsTableViewCell.self)
        
        return tableView
    }()
    
    // MARK: - Override functions
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
    }
    
    // MARK: - Functions
    
    @objc func pushVC() {
        navigationController?.pushViewController(PetProfileViewController(), animated: true)
    }
}

    // MARK: - UITableViewDataSource

extension UserProfileViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.numberOfSections
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = UserProfileSectionsEnum(rawValue: section)
        
        switch section {
        case .info:
            return Constants.NumberOfRowsInSection.one
        case .detail:
            return Constants.NumberOfRowsInSection.two
        default:
            return Constants.NumberOfRowsInSection.one
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionIndexPath = indexPath.section
        let section = UserProfileSectionsEnum(rawValue: sectionIndexPath)

        switch section {
        case .info:
            return configureInfoCell(indexPath: indexPath)
        case .detail:
            if indexPath.row == 0 {
                return configureDescriptionCell(indexPath: indexPath)
            } else if indexPath.row == 1 {
                return configurePetsTableViewCell(indexPath: indexPath)
            } else if indexPath.row == 2 {
                return configureMeetingsTableViewCell(indexPath: indexPath)
            } else {
                return UITableViewCell()
            }
        default:
            return UITableViewCell()
        }
    }
}

    // MARK: - UITableViewDelegate

extension UserProfileViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
//        let sectionIndexPath = indexPath.section
//        let section = UserProfileSectionsEnum(rawValue: sectionIndexPath)
//
//        if section == .info {
////            cell.layer.mask = makeMaskLayer(cell: cell, byRoundingCorners: .allCorners)
//        } else if section == .detail {
//            if indexPath.row == 0 {
//                cell.layer.mask = makeMaskLayer(cell: cell, byRoundingCorners: [.topLeft, .topRight])
//            } else if indexPath.row == Constants.NumberOfRowsInSection.two - 1 {
//                cell.layer.mask = makeMaskLayer(cell: cell, byRoundingCorners: [.bottomLeft, .bottomRight])
//            }
//        }
    }
}

    // MARK: - Extension

extension UserProfileViewController {
    private func configureInfoCell(indexPath: IndexPath) -> InfoCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as InfoCell
        cell.avatarImageView.image = UserProfileUIAsset.daenerys.image
        cell.nameLabel.text = "Дейнерис Бурерожденная Таргариен"
        cell.locationLabel.text = "Королевская гавань, Вестерос"
        
        return cell
    }
    
    private func configureDescriptionCell(indexPath: IndexPath) -> DescriptionCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as DescriptionCell
        cell.aboutLabel.text = "Дейнерис из дома Таргариенов, именуемая первой, Неопалимая, Королева Миэрина, Королева Андалов, Ройнаров и Первых Людей, Кхалиси Дотракийского Моря, Разбивающая Оковы и Матерь Драконов"
        return cell
    }
    
    private func configurePetsTableViewCell(indexPath: IndexPath) -> PetsTableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as PetsTableViewCell
        return cell
    }
    
    private func configureMeetingsTableViewCell(indexPath: IndexPath) -> MeetingsTableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as MeetingsTableViewCell
        return cell
    }
    
//    private func makeMaskLayer(cell: UITableViewCell, byRoundingCorners corners: UIRectCorner) -> CAShapeLayer {
//        let maskPath = UIBezierPath(roundedRect: cell.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: Constants.cornerRadius, height: Constants.cornerRadius))
//        let maskLayer = CAShapeLayer()
//        maskLayer.frame = cell.bounds
//        maskLayer.path = maskPath.cgPath
//        return maskLayer
//    }
}
