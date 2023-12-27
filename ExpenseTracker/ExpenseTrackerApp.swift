//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by thinkyDeveloper on 22/12/23.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
