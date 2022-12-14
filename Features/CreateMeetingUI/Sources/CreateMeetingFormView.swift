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
        static let cornerRadius: CGFloat = 16.0
        static let shadowCornerRaduis: CGFloat = 6.0
        
        enum BackButton {
            static let topAnchor: CGFloat = 25.33
            static let leadingAnchor: CGFloat = 21.33
        }
        
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
            
            enum Picker {
                static let duration: TimeInterval = 0.3
                static let datePickerTag: Int = 1
                static let timeWheelsTag: Int = 2
            }
        }
        
        enum ButtonsStackView {
            static let spacing: CGFloat = 24.0
            
            static let topAnchor: CGFloat = 32.0
            static let bottomAnchor: CGFloat = -23.0
            static let leadingAnchor: CGFloat = 17.0
            static let trailingAnchor: CGFloat = -17.0
        }
    }
    
    // MARK: - Properties
    
    private let backButton = CommonUIBackButton()
    private let cancelButton = CommonUIEmptyButton()
    private let createButton = CommonUIFilledButton()
    
    private let newMeetingLabel = UILabel()
    
    private lazy var buttonsStackView = UIStackView()
    private let textFieldsStackView = UIStackView()
    
    private var datePickerIsHidden = true
    private var timeWheelsIsHidden = true
    
    
    // MARK: - Override functions
    
    override init(frame: CGRect) {        
        super.init(frame: frame)

        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        createCustomShadow(cornerRadius: Constants.shadowCornerRaduis)
        layer.cornerRadius = Constants.cornerRadius
    }
    
    // MARK: - Configuration
    
    private func configuration() {
        backgroundColor = .white
        
        cancelButton.setTitle(CommonButtonsTitlesEnum.cancel.rawValue, for: .normal)
        
        createButton.setTitle(CommonButtonsTitlesEnum.create.rawValue, for: .normal)
        
        newMeetingLabel.font = CommonUIFontFamily.Inter.semiBold.font(size: Constants.NewMeetingLabel.fontSize)
        newMeetingLabel.text = Constants.NewMeetingLabel.text
        
        textFieldsStackView.axis = .vertical
        textFieldsStackView.spacing = Constants.TextFieldsStackView.spacing
        
        buttonsStackView.addArrangedSubview(cancelButton)
        buttonsStackView.addArrangedSubview(createButton)
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = Constants.ButtonsStackView.spacing
        
        makeTextFields()
        
        setupConstraints()
    }
    
    // MARK: - Objective-C functions
    
    @objc private func switchDatePicker() {
        guard let datePicker = findIndex(of: MeetingsTitlesEnum.datePicker) as? UIDatePicker else { return }
        
        datePickerIsHidden = !datePickerIsHidden
        
        if (timeWheelsIsHidden == false) &&
            (datePickerIsHidden == false) {
            switchTimeWheels()
        }
        
                
        switchPickerWithAnimate(withDuration: Constants.TextFieldsStackView.Picker.duration, picker: datePicker, itemIsHidden: datePickerIsHidden)
    }
    
    @objc private func switchTimeWheels() {
        guard let timeWheels = findIndex(of: MeetingsTitlesEnum.timeWheels) as? UIDatePicker else { return }
        
        timeWheelsIsHidden = !timeWheelsIsHidden
        
        if (timeWheelsIsHidden == false) &&
            (datePickerIsHidden == false) {
            switchDatePicker()
        }

        switchPickerWithAnimate(withDuration: Constants.TextFieldsStackView.Picker.duration, picker: timeWheels, itemIsHidden: timeWheelsIsHidden)
    }
  
    #warning("Доделать")
//    @objc private func switchPicker() {
//        guard let datePicker = findIndex(of: MeetingsTitlesEnum.datePicker) as? UIDatePicker,
//              let timeWheels = findIndex(of: MeetingsTitlesEnum.timeWheels) as? UIDatePicker,
//              let dateLabel = findIndex(of: MeetingsTitlesEnum.date) as? UILabel,
//              let timeLabel = findIndex(of: MeetingsTitlesEnum.time) as? UILabel
//        else { return }
//
//
//
//        if (timeWheels.isHidden == false) &&
//            (datePicker.isHidden == false) {
//            switchPicker()
//        }
//    }
    
    @objc private func datePickerAction(_ datePicker: UIDatePicker) {
        let dateFormatter = CommonDateFormatterSingleton.shared
        
        switch datePicker.tag {
        case Constants.TextFieldsStackView.Picker.datePickerTag:
            guard let label = findIndex(of: MeetingsTitlesEnum.date) as? UILabel else { return }
            
            let dateFormat = dateFormatter.dateFormatterOfDate
            label.text = dateFormat.string(from: datePicker.date)
            label.textColor = .black
            
        case Constants.TextFieldsStackView.Picker.timeWheelsTag:
            guard let label = findIndex(of: MeetingsTitlesEnum.time) as? UILabel else { return }
            
            let timeFormat = dateFormatter.dateFormatterOfTime
            label.text = timeFormat.string(from: datePicker.date)
            label.textColor = .black
            
        default:
            return
        }
        
        self.endEditing(true)
    }
    
    // MARK: - Functions
    
    private func makeTextFields() {
        for index in MeetingsTitlesEnum.allCases.indices {
            
            switch MeetingsTitlesEnum.allCases[index] {
            case .date:
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(switchDatePicker))
                
                let dateLabel = CommonUICreateFormLabel()
                dateLabel.addGestureRecognizer(tapGestureRecognizer)
                dateLabel.text = MeetingsTitlesEnum.date.rawValue
                
                textFieldsStackView.addArrangedSubview(dateLabel)
                
            case .datePicker:
                let datePicker = CommonUIDatePicker()
                datePicker.addTarget(self, action: #selector(datePickerAction(_:)), for: .valueChanged)
                datePicker.isHidden = datePickerIsHidden
                datePicker.tag = Constants.TextFieldsStackView.Picker.datePickerTag
                
                textFieldsStackView.addArrangedSubview(datePicker)
                
            case .time:
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(switchTimeWheels))
                
                let timeLabel = CommonUICreateFormLabel()
                timeLabel.addGestureRecognizer(tapGestureRecognizer)
                timeLabel.text = MeetingsTitlesEnum.time.rawValue
                
                textFieldsStackView.addArrangedSubview(timeLabel)
                
            case .timeWheels:
                let timeWheels = CommonUITimeWheels()
                timeWheels.addTarget(self, action: #selector(datePickerAction(_:)), for: .valueChanged)
                timeWheels.isHidden = timeWheelsIsHidden
                timeWheels.tag = Constants.TextFieldsStackView.Picker.timeWheelsTag
                
                textFieldsStackView.addArrangedSubview(timeWheels)
            
            default:
                let textField = CommonUICreateFormTextField()
                textField.placeholder = MeetingsTitlesEnum.allCases[index].rawValue
                
                textFieldsStackView.addArrangedSubview(textField)
            }
        }
    }
    
    private func switchPickerWithAnimate(withDuration duration: TimeInterval, picker: UIDatePicker, itemIsHidden: Bool) {
        UIView.animate(withDuration: duration) {
            picker.isHidden = itemIsHidden
        }
    }
    
    private func findIndex(of element: MeetingsTitlesEnum) -> UIView? {
        guard let index = MeetingsTitlesEnum.allCases.firstIndex(of: element) else { return nil }

        let picker = textFieldsStackView.arrangedSubviews[index]
        return picker
    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        setupNewMeetingLabelContraints()
        setupBackButtonConstraints()
        setupTextFieldsStackViewContraints()
        setupButtonsStackViewConstraints()
    }
    
    private func setupNewMeetingLabelContraints() {
        self.addSubview(newMeetingLabel)
        newMeetingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newMeetingLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.NewMeetingLabel.topAnchor),
            newMeetingLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupBackButtonConstraints() {
        self.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: Constants.BackButton.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.BackButton.leadingAnchor)
        ])
    }
    
    private func setupTextFieldsStackViewContraints() {
        self.addSubview(textFieldsStackView)
        textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textFieldsStackView.topAnchor.constraint(equalTo: newMeetingLabel.bottomAnchor, constant: Constants.TextFieldsStackView.topAnchor),
            textFieldsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.TextFieldsStackView.leadingAnchor),
            textFieldsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.TextFieldsStackView.trailingAnchor)
        ])
    }
    
    private func setupButtonsStackViewConstraints() {
        self.addSubview(buttonsStackView)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: Constants.ButtonsStackView.topAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.ButtonsStackView.bottomAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.ButtonsStackView.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.ButtonsStackView.trailingAnchor),
        ])
    }
}
