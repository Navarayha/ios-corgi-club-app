//
//  MeetingsTitlesEnum.swift
//  CreateMeetingUI
//
//  Created by Микаэл Мартиросян on 13.12.2022.
//  Copyright © 2022 CoffeAndCode.org. All rights reserved.
//

import Foundation

public enum MeetingsTitlesEnum: String {
    case name = "Название встречи"
    case date = "Дата"
    case datePicker
    case time = "Время"
    case timeWheels
    case place = "Место встречи"
    
    static let allCases = [name, date, datePicker, time, timeWheels, place]
}
