//
//  ViewController.swift
//  CreateMeetingUI
//
//  Created by Микаэл Мартиросян on 10.12.2022.
//

import UIKit
import CommonUI

public class CreateMeetingController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        enum CreateMeetingFormView {
            static let topAnchor: CGFloat = 60.0
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
        CGSize(width: view.frame.width, height: view.frame.height + 60)
    }
    
    private lazy var createMeetingFormView = CreateMeetingFormView()
    
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
        
        view.backgroundColor = CommonUIAsset.backgroundColor.color
        
        setupConstraints()
    }
    
    // MARK: - Functions
    
    private func setupConstraints() {
        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupCreateMeetingFormViewContraints()
    }
    
    private func setupScrollViewConstraints() {
        view.addSubview(scrollView)
    }
    
    private func setupContentViewConstraints() {
        scrollView.addSubview(contentView)
    }
    
    private func setupCreateMeetingFormViewContraints() {
        contentView.addSubview(createMeetingFormView)
        createMeetingFormView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createMeetingFormView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.CreateMeetingFormView.topAnchor),
            createMeetingFormView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.CreateMeetingFormView.leadingAnchor),
            createMeetingFormView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.CreateMeetingFormView.trailingAnchor),
//            createMeetingFormView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
