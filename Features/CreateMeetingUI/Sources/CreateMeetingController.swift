//
//  ViewController.swift
//  CreateMeetingUI
//
//  Created by Микаэл Мартиросян on 10.12.2022.
//

import UIKit

public class CreateMeetingController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        enum CreateMeetingFormView {
            static let topAnchor: CGFloat = 60.0
            static let leadingAnchor: CGFloat = 16.0
            static let trailingAnchor: CGFloat = -16.0
            static let bottomAnchor: CGFloat = -333.0
        }
    }
    
    // MARK: - Properties
    
    private let createMeetingFormView = CreateMeetingFormView()
    
    // MARK: - Override functions

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .orange
        
        setupCreateMeetingFormViewContraints()
    }
    
    // MARK: - Functions
    
    private func setupCreateMeetingFormViewContraints() {
        view.addSubview(createMeetingFormView)
        createMeetingFormView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createMeetingFormView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.CreateMeetingFormView.topAnchor),
            createMeetingFormView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.CreateMeetingFormView.bottomAnchor),
            createMeetingFormView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.CreateMeetingFormView.leadingAnchor),
            createMeetingFormView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.CreateMeetingFormView.trailingAnchor)
        ])
    }
}

