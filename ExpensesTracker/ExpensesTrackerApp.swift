//
//  ExpensesTrackerApp.swift
//  ExpensesTracker
//
//  Created by Lore P on 17/04/2023.
//

import SwiftUI

@main
struct ExpensesTrackerApp: App {
  @StateObject var transactionListVM = TransactionListVM()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(transactionListVM)
    }
  }
}
