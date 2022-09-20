//
//  UserModel.swift
//  corgi-club-login-test
//
//  Created by Mikhail Chuparnov on 25.08.2022.
//

import Foundation

public struct CCUser: Identifiable, Codable {
    public var id: String?
    var name: String
    var secondName: String
    var login: String
  }
