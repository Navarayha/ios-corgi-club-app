//
//  PetsTableViewCell.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 28.10.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import Common

class PetsTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
#warning("вынести bg color в Common как общий цвет фона приложения")
        static let backgroundColor: UIColor = UIColor(red: 1, green: 0.983, blue: 0.96, alpha: 1)
        static let minimumLineSpacingForSection: CGFloat = 20.0
        
        enum ShadowView {
            static let shadowColor: CGColor = UIColor(red: 0.521, green: 0.325, blue: 0.031, alpha: 0.06).cgColor
            static let shadowOffset: CGSize = CGSize(width: 0, height: 2)
            static let shadowOpacity: Float = 1.0
            static let shadowRadius: CGFloat = 6.0
        }
        
        enum TitleLabel {
            static let fontSize: CGFloat = 18.0
            static let text: String = "Мои питомцы"
                        
            static let topAnchorConstant: CGFloat = 24.0
            static let leadingAnchorConstant: CGFloat = 16.0
            static let heightAnchorConstant: CGFloat = 22.0
        }
        
        enum CollectionView {
            static let topAnchorConstant: CGFloat = 16.0
            static let bottomAnchorConstant: CGFloat = -24.0
            static let leadingAnchorConstant: CGFloat = 16.0
            static let heightAnchorConstant: CGFloat = 80.0
        }
    }
    
    // MARK: - Proporties
    
    private let collectionView = PetsCollectionView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: CustomFontName.medium, size: Constants.TitleLabel.fontSize)
        label.text = Constants.TitleLabel.text
        label.textColor = .black
        return label
    }()
    
    private let shadowView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.blue.cgColor //Constants.ShadowView.shadowColor
        view.layer.shadowOffset = .zero //Constants.ShadowView.shadowOffset
        view.layer.shadowOpacity = Constants.ShadowView.shadowOpacity
#warning("добавить shadowPath")
        
//        let shadowRect: CGRect = view.bounds.insetBy(dx: 0, dy: 4)
//        view.layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
        
//        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .bottomLeft, .topRight, .bottomRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
//        view.layer.shadowPath = path
        
//        view.layer.shadowRadius = Constants.ShadowView.shadowRadius
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
        
    // MARK: - Override functions

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = Constants.backgroundColor
        
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        backgroundView = UIView(frame: contentView.frame)
//        backgroundView?.clipsToBounds = false
//        backgroundView?.backgroundColor = .clear
//
//        
//    }
    
    // MARK: - Functions
    
    private func setupContraints() {
        setupShadowViewContraints()
        setupContainerViewConstraints()
        setupTitleLabelContraints()
        setupCollectionViewContraints()
    }
    
    private func setupShadowViewContraints() {
        contentView.addSubview(shadowView)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: contentView.topAnchor),
            shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupContainerViewConstraints() {
        shadowView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: shadowView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor)
        ])
    }
    
    private func setupTitleLabelContraints() {
        containerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.TitleLabel.topAnchorConstant),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.TitleLabel.leadingAnchorConstant),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.TitleLabel.heightAnchorConstant),
        ])
    }
    
    private func setupCollectionViewContraints() {
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.CollectionView.topAnchorConstant),
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.CollectionView.bottomAnchorConstant),
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: Constants.CollectionView.heightAnchorConstant)
        ])
    }
}


public extension UITableViewCell {
    /** adds a drop shadow to the background view of the (grouped) cell */
    func addShadowToCellInTableView(lastIndex: Int, atIndexPath indexPath: IndexPath!) {
        let isFirstRow: Bool = indexPath.row == 0
        let isLastRow: Bool = (indexPath.row == lastIndex - 1)

        guard let backgroundView = self.backgroundView else { return }

        let backBounds = backgroundView.bounds
        // the shadow rect determines the area in which the shadow gets drawn
        var shadowRect: CGRect = backBounds.insetBy(dx: 0, dy: -10)
        if isFirstRow {
            shadowRect.origin.y += 10
        } else if isLastRow {
            shadowRect.size.height -= 10
        }

        // the mask rect ensures that the shadow doesn't bleed into other table cells
        var maskRect: CGRect = backBounds.insetBy(dx: -20, dy: 0)
        if isFirstRow {
            maskRect.origin.y -= 10
            maskRect.size.height += 10
        } else if isLastRow {
            maskRect.size.height += 10
        }

        // now configure the background view layer with the shadow
        let layer: CALayer = backgroundView.layer
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.23
        layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
        layer.masksToBounds = false

        // and finally add the shadow mask
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(rect: maskRect).cgPath
        layer.mask = maskLayer
    }

    func addShadowToSingleCell() {
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor

        layer.shadowPath = UIBezierPath(roundedRect: contentView.frame,
                                        cornerRadius: contentView.layer.cornerRadius).cgPath
    }
}
