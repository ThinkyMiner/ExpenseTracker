//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by thinkyDeveloper on 24/12/23.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        VStack {
            List{
                //MARK: Transaction Groups
                ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key){
                    month, transactions in
                    Section{
                        //MARK: Transaction Month
                        ForEach (transactions) { transaction in
                            TransactionRow (transaction: transaction)
                        }
                    }
                    header:{
                            Text(month)
                    }
                    .listSectionSeparator(.hidden)
                    
                }
            }
            .listStyle(.plain)
        }
            .navigationTitle("Transactions")
            .navigationBarTitleDisplayMode(.inline)
        }
}
struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionPreviewDataList
        return transactionListVM
    }()
    static var previews: some View {
        Group{
            NavigationView {
                TransactionList()
            }
        }
        .environmentObject(transactionListVM)
    }
}
