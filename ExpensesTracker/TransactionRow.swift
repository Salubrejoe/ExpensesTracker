//
//  TransactionRow.swift
//  ExpensesTracker
//
//  Created by Lore P on 17/04/2023.
//

import SwiftUI
import SwiftUIFontIcon


struct TransactionRow: View {
  var transaction: Transaction
  
  var body: some View {
    HStack(spacing: 20) {
      
      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .fill(Color.icons.opacity(0.3))
        .frame(width: 44, height: 44)
        .overlay {
          FontIcon.text(.awesome5Solid(code: transaction.icon), fontsize: 24, color: Color.icons)
        }
      
      VStack(alignment: .leading, spacing: 6) {
        Text(transaction.merchant)
          .font(.subheadline)
          .bold()
          .lineLimit(1)
        
        Text(transaction.category)
          .font(.footnote)
          .opacity(0.7)
          .lineLimit(1)
        
        Text(transaction.dateParsed, format: .dateTime.day().month().year())
          .font(.footnote)
          .foregroundColor(.secondary)
      }//: Vstack
      
      Spacer()
      
      Text(transaction.signedAmount, format: .currency(code: "GBP"))
        .bold()
        .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.text : .primary)
      
    }
    .padding([.top, .bottom], 8)
  }
}

struct TransactionRow_Previews: PreviewProvider {
  static var previews: some View {
    TransactionRow(transaction: transactionPreviewData)
      .previewLayout(.sizeThatFits)
      .padding()
    TransactionRow(transaction: transactionPreviewData)
      .preferredColorScheme(.dark)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
