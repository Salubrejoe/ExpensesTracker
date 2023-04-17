//
//  TransactionList.swift
//  ExpensesTracker
//
//  Created by Lore P on 17/04/2023.
//

import SwiftUI

struct TransactionList: View {
  
  @EnvironmentObject var transactionListVM: TransactionListVM
  
  
  var body: some View {
    VStack  {
      List {
        ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key) { month, transactions in
          Section {
            ForEach(transactions) { transaction in
              TransactionRow(transaction: transaction)
            }
          } header: {
            Text(month)
          }
          .listSectionSeparator(.hidden)
        }
      }
    }
    .navigationTitle("Transactions")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct TransactionList_Previews: PreviewProvider {
  static let transactionListVM: TransactionListVM = {
    let tLVM = TransactionListVM()
    tLVM.transactions = transactionListPreviewData
    return tLVM
  }()
  
  static var previews: some View {
    NavigationView {
      TransactionList()
        .environmentObject(transactionListVM)
        .preferredColorScheme(.dark)
    }
  }
}
