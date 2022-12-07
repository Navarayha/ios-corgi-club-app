//
//  UserProfileViewController.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 06.12.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import Common

public class UserProfileViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        
        enum InfoView {
            static let topAnchor: CGFloat = 60.0
            static let leadingAnchor: CGFloat = 16.0
            static let trailingAnchor: CGFloat = -16.0
        }
        
        enum DetailView {
            static let topAnchor: CGFloat = 24.0
            static let bottomAnchor: CGFloat = 24.0
            static let leadingAnchor: CGFloat = 16.0
            static let trailingAnchor: CGFloat = -16.0
        }
    }
    
    // MARK: - Properties
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.frame.size = contentSize
        return view
    }()

    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + Constants.DetailView.bottomAnchor)
    }
    
    private lazy var detailView = DetailView()
    
    private lazy var infoView = InfoView()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
//    let customButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Segue", for: .normal)
//        button.setTitleColor(.red, for: .normal)
//        button.backgroundColor = .blue
//        return button
//    }()
    
    // MARK: - Override functions
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = CommonConstants.View.backgroundColor
        
        setupConfigs()
        setupConstraints()
        
//        setupButton()
//        customButton.addTarget(self, action: #selector(openNextContr), for: .touchUpInside)
        
//        let petsDelegate = PetsCollectionView()
//        petsDelegate.addNewPetDelegate = self
        
        
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        detailView.layer.shadowPath = UIBezierPath(roundedRect: detailView.bounds, cornerRadius: CommonConstants.View.cornerRadius).cgPath
    }
    
    // MARK: - Functions
    
    // MARK: Configs
    private func setupConfigs() {
        setupInfoViewConfig()
        setupDetailViewConfig()
    }
    
    private func setupInfoViewConfig() {
        infoView.avatarImageView.image = userData.avatar
        infoView.nameLabel.text = userData.name
        infoView.locationLabel.text = userData.location
    }
    
    private func setupDetailViewConfig() {
        detailView.descriptionView.aboutLabel.text = userData.about
    }
    
    // MARK: Constraints
    private func setupConstraints() {
        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupInfoViewConstraints()
        setupDetailViewConstraints()
    }
    
    private func setupScrollViewConstraints() {
        view.addSubview(scrollView)
    }
    
    private func setupContentViewConstraints() {
        scrollView.addSubview(contentView)
    }
        
    private func setupInfoViewConstraints() {
        contentView.addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.InfoView.topAnchor),
            infoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.InfoView.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.InfoView.trailingAnchor)
        ])
    }
    
    private func setupDetailViewConstraints() {
        contentView.addSubview(detailView)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: Constants.DetailView.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.DetailView.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.DetailView.trailingAnchor)
        ])
    }
    
//    func setupButton() {
//        contentView.addSubview(customButton)
//        customButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            customButton.topAnchor.constraint(equalTo: contentView.topAnchor),
//            customButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            customButton.heightAnchor.constraint(equalToConstant: 50),
//            customButton.widthAnchor.constraint(equalToConstant: 50)
//        ])
//    }
    
    func openNextContr() {
        let vc = PetProfileViewController()
//        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        print("openNextContr")
        dismiss(animated: true)
    }
}

//extension UserProfileViewController: AddNewPetProtocol {
//    func addNewPet() {
//        #warning("delegate")
//        let vc = PetProfileViewController()
//        navigationController?.pushViewController(vc, animated: true)
//
//    }
//}
