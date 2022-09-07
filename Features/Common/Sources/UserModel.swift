//
//  UserModel.swift
//  corgi-club-login-test
//
//  Created by Mikhail Chuparnov on 25.08.2022.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String?
    var name: String
    var city: String
  }
