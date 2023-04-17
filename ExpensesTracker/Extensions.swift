//
//  Extensions.swift
//  ExpensesTracker
//
//  Created by Lore P on 17/04/2023.
//

import Foundation
import SwiftUI

extension Color {
  static let background = Color("Background")
  static let icons = Color("Icons")
  static let text = Color("Text")
  static let systemBackground = Color(uiColor: .systemBackground)
}


extension DateFormatter {
  static let allNumericUK: DateFormatter = {
    print("Initializing date formatter")
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    return formatter
  }()
}


extension String {
  func dateParse() -> Date {
    guard let parsedDate = DateFormatter.allNumericUK.date(from: self) else { return Date() }
    return parsedDate
  }
}
