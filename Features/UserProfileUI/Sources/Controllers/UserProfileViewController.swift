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
    
    private var detailView: DetailView?
    
    private lazy var infoView = InfoView()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    // MARK: - Override functions
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView = DetailView(frame: .zero, petDelegate: self)
        
        view.backgroundColor = CommonConstants.View.backgroundColor
        
        setupConfigs()
        setupConstraints()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let detailView  = detailView else { return }
        
        detailView.layer.shadowPath = UIBezierPath(roundedRect: detailView.bounds, cornerRadius: CommonConstants.View.cornerRadius).cgPath
    }
    
    // MARK: - Functions
    
    @objc func editButtonSelected() {
        // open Profile Edit Controller
    }
    
    // MARK: Configs
    private func setupConfigs() {
        setupInfoViewConfig()
        setupDetailViewConfig()
    }
    
    private func setupInfoViewConfig() {
        infoView.avatarImageView.image = userData.avatar
        infoView.nameLabel.text = userData.name
        infoView.locationLabel.text = userData.location
        infoView.editButton.addTarget(self, action: #selector(editButtonSelected), for: .touchUpInside)
    }
    
    private func setupDetailViewConfig() {
        guard let detailView  = detailView else { return }
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
        guard let detailView  = detailView else { return }
        contentView.addSubview(detailView)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: Constants.DetailView.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.DetailView.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.DetailView.trailingAnchor)
        ])
    }
}

    // MARK: - MeetingControllerDelegate

extension UserProfileViewController: MeetingControllerDelegate {
    
    public func meetingSelected() {
        // open Meeting Controller
    }
    
    public func addMeeting() {
        // open Add Meeting Controller
    }
}

    // MARK: - - PetControllerDelegate

extension UserProfileViewController: PetControllerDelegate {
    
    public func petSelected() {
        // open Pet Profile Controller
    }
    
    public func addPet() {
        // open Add Pet Controller
    }
}
