//
//  UserPetsModel.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 15.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

struct UserPetsModel {
    var avatar: UIImage
    var name: String
    
    static func fetchUserPets() -> [UserPetsModel] {
        let firstPet = UserPetsModel(avatar: UIImage(systemName: "person")!, name: "Шарик")
        let secondPet = UserPetsModel(avatar: UIImage(systemName: "person")!, name: "Рекс")
        let thirdPet = UserPetsModel(avatar: UIImage(systemName: "person")!, name: "Рекс")
        let fourthPet = UserPetsModel(avatar: UIImage(systemName: "person")!, name: "Рекс")
        let fifthPet = UserPetsModel(avatar: UIImage(systemName: "person")!, name: "Рекс")
        let sixthPet = UserPetsModel(avatar: UIImage(systemName: "person")!, name: "Рекс")
        let seventhPet = UserPetsModel(avatar: UIImage(systemName: "person")!, name: "Рекhjhgjkhgjhgjhgс")
        return [firstPet, secondPet, thirdPet, fourthPet, fifthPet, sixthPet, seventhPet]
    }
}

