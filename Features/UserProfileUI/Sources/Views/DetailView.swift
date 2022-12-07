//
//  DetailView.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 06.12.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import Common

class DetailView: UIView {
    
    // MARK: - Properties
    
    let descriptionView = DescriptionView()
    let petsView = PetsView()
    let meetingsView = MeetingsView()
    
    private let firstSeparator = SeparatorView()
    private let secondSeparator = SeparatorView()
    
    // MARK: - Override functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        createCustomShadow()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: CommonConstants.View.cornerRadius).cgPath
    }
    
    // MARK: - Functions
    
    private func setupConstraints() {
        setupDescriptionViewConstraints()
        setupFirstSeparatorConstraints()
        setupPetsViewConstraints()
        setupSecondSeparatorConstraints()
        setupMeetingsViewConstraints()
    }
    
    private func setupDescriptionViewConstraints() {
        addSubview(descriptionView)
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: topAnchor),
            descriptionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupFirstSeparatorConstraints() {
        addSubview(firstSeparator)
        firstSeparator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstSeparator.topAnchor.constraint(equalTo: descriptionView.bottomAnchor),
            firstSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            firstSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            firstSeparator.heightAnchor.constraint(equalToConstant: 1.0)
        ])
    }
    
    private func setupPetsViewConstraints() {
        addSubview(petsView)
        petsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            petsView.topAnchor.constraint(equalTo: firstSeparator.bottomAnchor),
            petsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            petsView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupSecondSeparatorConstraints() {
        addSubview(secondSeparator)
        secondSeparator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondSeparator.topAnchor.constraint(equalTo: petsView.bottomAnchor),
            secondSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondSeparator.heightAnchor.constraint(equalToConstant: 1.0)
        ])
    }
    
    private func setupMeetingsViewConstraints() {
        addSubview(meetingsView)
        meetingsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            meetingsView.topAnchor.constraint(equalTo: secondSeparator.bottomAnchor),
            meetingsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            meetingsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            meetingsView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
