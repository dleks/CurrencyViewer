//
//  DateExtension.swift
//  CurrencyViewer
//
//  Created by Dmitrii Leksashov on 29/05/2019.
//  Copyright © 2019 Dmitrii Leksashov. All rights reserved.
//

import Foundation
enum DateFormat: String {
    case dayMonthYear = "dd MMMM YYYY"
    case yearMonthDay = "YYYY/MM/dd"
}

extension Date {
    static func formatter(format: DateFormat) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter
    }
    
    func toString(with format: DateFormat) -> String {
        return Date.formatter(format: format).string(from: self)
    }
    
    func removal(value: Int, component: Calendar.Component) -> Date? {
        return Calendar.current.date(byAdding: component, value: -value, to: self)
    }
}
