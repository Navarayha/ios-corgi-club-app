//
//  UserPetsCell.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 15.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

class UserPetsCell: UICollectionViewCell {
    
    static let reuseID = "UserPetsCell"
    
    let petAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    let petName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up cell
    
    private func setupConstraints() {
        contentView.addSubview(petAvatar)
        petAvatar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            petAvatar.widthAnchor.constraint(equalToConstant: 60),
            petAvatar.heightAnchor.constraint(equalToConstant: 60),
            petAvatar.topAnchor.constraint(equalTo: topAnchor),
            petAvatar.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        contentView.addSubview(petName)
        petName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            petName.heightAnchor.constraint(equalToConstant: 15),
            petName.topAnchor.constraint(equalTo: petAvatar.bottomAnchor, constant: 5),
            petName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            petName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3)
            
        ])
    }
    
    override func prepareForReuse() {
        petAvatar.image = nil
        petName.text = nil
    }
}
