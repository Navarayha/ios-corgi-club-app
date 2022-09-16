//
//  InfoView.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 15.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

class InfoView: UIView {
    
    let avatar: UIImageView = {
        let imageView = UIImageView()
#warning ("Убрать заглушку")
        imageView.image = UIImage(systemName: "person")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.systemGray5.cgColor
        return imageView
    }()
    
    let name: UILabel = {
        let label = UILabel()
#warning ("Убрать заглушку")
        label.text = "Ivan Ivanov"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    let location: UILabel = {
        let label = UILabel()
#warning ("Убрать заглушку")
        label.text = "Москва, Россия"
        label.textColor = .black
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContraints() {
        addSubview(avatar)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            avatar.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatar.widthAnchor.constraint(equalToConstant: 170),
            avatar.heightAnchor.constraint(equalToConstant: 170)
        ])
        
        addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 13),
            name.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            name.heightAnchor.constraint(equalToConstant: 23),
            name.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        addSubview(location)
        location.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            location.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            location.heightAnchor.constraint(equalToConstant: 12),
            location.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            location.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatar.layer.cornerRadius = avatar.frame.height / 2
    }
}
