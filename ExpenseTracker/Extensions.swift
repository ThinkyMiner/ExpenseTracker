//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by thinkyDeveloper on 22/12/23.
//

import Foundation
import SwiftUI

extension Color{
    static let Background = Color("Background")
    static let Text = Color("Text")
    static let Icon = Color("Icon")
    static let systembackground = Color(uiColor: .systemBackground)
}

extension DateFormatter{
    static let allNumericUSA: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
}

extension String{
    func dateParsed() -> Date{
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self)else{
            return Date()
        }
        return parsedDate
    }
}
extension Double {
    func roundedTo2Digits () -> Double {
        return (self * 100).rounded () / 100
    }
}



