//
//  UserProfileStruct.swift
//  UserProfileUI
//
//  Created by Микаэл Мартиросян on 23.10.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit

public enum UserProfileSectionsEnum: Int, CaseIterable {
    case info
    case detail
}
//
//public struct UserProfileStruct {
//    let info: InfoStruct
//    let detail: DetailStruct
//}
//
//public struct InfoStruct {
//    let avatar: UIImage
//    let name: String
//    let location: String
//}
//
//public struct DetailStruct {
//    let aboutMe: AboutMeStruct
//    let myPetsStruct: MyPetsStruct
//    let myMeetingsStruct: MyMeetingsStruct
//}
//
//public struct AboutMeStruct {
//    let aboutMeTitle: String
//    let aboutMeText: String
//}
//
//public struct MyPetsStruct {
//    let myPetsTitle: String
//    let myPetsCollection: [MyPets]
//
//    public struct MyPets {
//        let myPetsAvatar: UIImage
//        let myPetsName: String
//    }
//}
//
//public struct MyMeetingsStruct {
//    let myMeetingsTitle: String
//    let myMeetingsCollection: [MyMeetings]
//
//    public struct MyMeetings {
//        let myMeetingsMonth: String
//        let myMeetingsDay: String
//    }
//}
