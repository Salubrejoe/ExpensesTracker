//
//  RecentTransactionList.swift
//  ExpensesTracker
//
//  Created by Lore P on 17/04/2023.
//

import SwiftUI

struct RecentTransactionList: View {
  
  @EnvironmentObject var transactionListVM: TransactionListVM
  
  var body: some View {
    VStack {
      HStack {
        // MARK: - Header
        Text("Recent transactions")
          .bold()
        
        Spacer()
        
        NavigationLink {
          TransactionList()
            
        } label: {
          HStack(spacing: 4) {
            Text("See all")
            Image(systemName: "chevron.right")
          }
          .foregroundColor(Color.text)
        }
      }
      .padding(.top)
      
      // MARK: - List
      ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element) { index, transaction in
        TransactionRow(transaction: transaction)
        Divider()
          .opacity(index == 4 ? 0 : 1)
      }
    }
    .padding()
    .background(Color.systemBackground)
    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    .shadow(color: .primary.opacity(0.2), radius: 10, x: 0, y: 5)
  }
}

struct RecentTransactionList_Previews: PreviewProvider {
  
  static let transactionListVM: TransactionListVM = {
    let tLVM = TransactionListVM()
    tLVM.transactions = transactionListPreviewData
    return tLVM
  }()
  
  
  static var previews: some View {
    RecentTransactionList()
      .environmentObject(transactionListVM)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
