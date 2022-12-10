//
//  CreateMeetingFormView.swift
//  CreateMeetingUI
//
//  Created by Микаэл Мартиросян on 10.12.2022.
//

import UIKit
import Common
import CommonUI

class CreateMeetingFormView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        enum NewMeetingLabel {
            static let fontSize: CGFloat = 20.0
            static let text: String = "Новая встреча"
            
            static let topAnchor: CGFloat = 20.0
        }
        
        enum TextFieldsStackView {
            static let spacing: CGFloat = 24.0
            
            static let topAnchor: CGFloat = 36.0
            static let leadingAnchor: CGFloat = 16.0
            static let trailingAnchor: CGFloat = -16.0
            
            enum TextField {
                static let borderColor: CGColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
                static let borderWidth: CGFloat = 1.0
                static let cornerRadius: CGFloat = 8.0
                static let fontSize: CGFloat = 16.0
                static let textColor: UIColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
                static let textFieldsName: [String] = ["Название встречи", "Дата", "Время", "Место встречи"]
            }
        }
    }
    
    // MARK: - Properties
    
    private let newMeetingLabel: UILabel = {
        let label = UILabel()
        label.font = CommonUIFontFamily.Inter.semiBold.font(size: Constants.NewMeetingLabel.fontSize)
        label.text = Constants.NewMeetingLabel.text
        label.textColor = .black
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = CommonUIAsset.arrow.image
        return imageView
    }()
    
    private let textFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = Constants.TextFieldsStackView.spacing
        return stackView
    }()
    
    // MARK: - Override functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        createCustomShadow()
        setupConstraints()
        
        makeTextFields()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: CommonConstants.View.smallCornerRaduis).cgPath
    }
    
    // MARK: - Functions
    
    private func makeTextFields() {
        for index in Constants.TextFieldsStackView.TextField.textFieldsName.indices {
            let textField = UITextField()
            #warning("Изменить font")
            textField.font = UIFont(name: "Montserrat-Medium", size: Constants.TextFieldsStackView.TextField.fontSize)
            textField.layer.borderColor = Constants.TextFieldsStackView.TextField.borderColor
            textField.layer.cornerRadius = Constants.TextFieldsStackView.TextField.cornerRadius
            textField.layer.borderWidth = Constants.TextFieldsStackView.TextField.borderWidth
            textField.placeholder = Constants.TextFieldsStackView.TextField.textFieldsName[index]
            textField.textAlignment = .left
            textField.textColor = .black
//            textField.lef
            textFieldsStackView.addArrangedSubview(textField)
        }
    }
    
    private func setupConstraints() {
        setupNewMeetingLabelContraints()
        setupArrowImageView()
        setupTextFieldsStackViewContraints()
    }
    
    private func setupNewMeetingLabelContraints() {
        self.addSubview(newMeetingLabel)
        newMeetingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newMeetingLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.NewMeetingLabel.topAnchor),
            newMeetingLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupArrowImageView() {
        self.addSubview(arrowImageView)
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arrowImageView.topAnchor.constraint(equalTo: topAnchor, constant: 25.33),
            arrowImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21.33)
        ])
    }
    
    private func setupTextFieldsStackViewContraints() {
        self.addSubview(textFieldsStackView)
        textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textFieldsStackView.topAnchor.constraint(equalTo: newMeetingLabel.bottomAnchor, constant: Constants.TextFieldsStackView.topAnchor),
            textFieldsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.TextFieldsStackView.leadingAnchor),
            textFieldsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.TextFieldsStackView.trailingAnchor),
            textFieldsStackView.heightAnchor.constraint(equalToConstant: 268)
        ])
    }
    
}
