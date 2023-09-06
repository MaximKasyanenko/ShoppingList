//
//  DateFormatter+Extension.swift
//  ShoppingList
//
//  Created by Maksim Kasyanenko on 28.08.2023.
//

import Foundation

extension DateFormatter {
    static var customDateTime: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // Use en_US_POSIX to ensure format consistency
        dateFormatter.timeZone = TimeZone.current // Adjust timeZone as needed
        return dateFormatter
    }()
}
