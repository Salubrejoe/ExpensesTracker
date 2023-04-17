//
//  ContentView.swift
//  ExpensesTracker
//
//  Created by Lore P on 17/04/2023.
//

import SwiftUI
import SwiftUICharts


struct ContentView: View {
  
  var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
  
  var body: some View {
    
    NavigationStack {
      ScrollView {
        VStack(alignment: .leading, spacing: 24) {
          Text("Overview")
            .font(.title)
            .bold()
          
          CardView {
            VStack {
              ChartLabel("£900", type: .title)
              
              LineChart()
            }
            .background(Color.systemBackground)
          }
          .data(demoData)
          .chartStyle(ChartStyle(backgroundColor: Color.systemBackground,
                                 foregroundColor: ColorGradient(Color.icons.opacity(0.4), Color.icons)))
          .frame(height: 300)
          
          RecentTransactionList()
        }
        .padding()
        .frame(maxWidth: .infinity)
      }
      .background(Color.background)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        // Notification
        ToolbarItem {
          Image(systemName: "bell.badge")
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.icons, .primary)
        }
      }
    }
    .accentColor(.primary)
  }
}

struct ContentView_Previews: PreviewProvider {
  static let transactionListVM: TransactionListVM = {
    let tLVM = TransactionListVM()
    tLVM.transactions = transactionListPreviewData
    return tLVM
  }()
  static var previews: some View {
    ContentView()
      .environmentObject(transactionListVM)
  }
}
