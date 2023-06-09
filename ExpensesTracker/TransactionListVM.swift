//
//  TransactionListVM.swift
//  ExpensesTracker
//
//  Created by Lore P on 17/04/2023.
//

import Foundation
import Combine
import Collections


typealias TransactionGroup = OrderedDictionary<String, [Transaction]>


final class TransactionListVM: ObservableObject {
  
  @Published var transactions : [Transaction] = []
  
  private var cancellables = Set<AnyCancellable>()
  
  
  init() {
    fetchTransactions()
  }
  
  
  func fetchTransactions() {
    let urlString = "https://designcode.io/data/transactions.json"
    
    guard let url = URL(string: urlString) else { return }
    
   URLSession.shared.dataTaskPublisher(for: url)
      .tryMap { (data, response) -> Data in
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200  else {
          dump(response)
          throw URLError(.badServerResponse)
        }
        return data
      }
      .decode(type: [Transaction].self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .sink { completion in
        switch completion {
          case .failure(let error):
            print("Error fetching transactions: \(error.localizedDescription).")
          case .finished:
            print("Finished fetching transactions.")
        }
      } receiveValue: { [weak self] result in
        self?.transactions = result
      }
      .store(in: &cancellables)
  }
  
  func groupTransactionsByMonth() -> TransactionGroup {
    guard !transactions.isEmpty else { return [:] }
    
    let groupedTransactions = TransactionGroup(grouping: transactions) { $0.month }
    
    return groupedTransactions
  }
}
