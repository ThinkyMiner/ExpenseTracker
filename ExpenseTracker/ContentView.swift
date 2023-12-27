//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by thinkyDeveloper on 22/12/23.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
//    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    //MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    //MARK: Make a Chart
                    let data = transactionListVM.accumulateTransaction()
                    let totalExpenses = data.last?.1 ?? 0
                    CardView{
                        VStack(alignment: .leading){
                            ChartLabel (totalExpenses.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                            LineChart()
                        }
                        .background(Color.systembackground)
                        
                    }
                            .data(data)
                            .chartStyle (ChartStyle(backgroundColor: Color.systembackground, foregroundColor: ColorGradient (Color.icon .opacity(0.4), Color.icon)))
                    .frame (height: 300)
                    
                    
                    //MARK: recent Transaction List
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }
            .background(Color.Background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                // MARK: Notification icon
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.Icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}


struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionPreviewDataList
        return transactionListVM
    }()
    static var previews: some View {
        Group {
            ContentView()
        }
        .environmentObject(transactionListVM)
    }
}

