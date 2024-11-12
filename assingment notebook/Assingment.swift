//
//  Assingment.swift
//  assingment notebook
//
//  Created by MATTHEW FITCH on 10/29/24.
//

import Foundation

enum PushNotis: Codable {
    case none, nightBefore, dayBefore
}

class 👁️ : Codable {
    var description: String = ""
    var notis: PushNotis
    var dueDate: DateComponents
    
    init(description: String, notis: PushNotis, dueDay: 💀, dueHour: Int, dueMinute: Int) {
        self.description = description
        self.notis = notis
        let calendar = Calendar.current
        
        var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        
        dateComponents.hour = dueHour
        dateComponents.minute = dueMinute
        dateComponents.year = dueDay.year
        dateComponents.month = dueDay.month
        dateComponents.day = dueDay.day
        
        self.dueDate = dateComponents
        
    }
}

class 💀 {
    var year: Int
    var month: Int
    var day: Int
    
    init(year: Int, month: Int, day: Int) {
        self.year = year
        self.month = month
        self.day = day
    }
}
