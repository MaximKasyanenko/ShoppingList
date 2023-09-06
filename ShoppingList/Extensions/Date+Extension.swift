//
//  Date+Extension.swift
//  ShoppingList
//
//  Created by Maksim Kasyanenko on 28.08.2023.
//

import Foundation

extension Date {
    func string() -> String {
        let dateFormatter = DateFormatter.customDateTime
        return dateFormatter.string(from: self)
    }
}
