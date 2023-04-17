//
//  PreviewData.swift
//  ExpensesTracker
//
//  Created by Lore P on 17/04/2023.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "17/04/2023", institution: "Licurgen Inc.", account: "Visa Licurgen", merchant: "Apple", amount: 7.89, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
