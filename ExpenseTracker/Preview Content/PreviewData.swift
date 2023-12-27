//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by thinkyDeveloper on 22/12/23.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "01/24/2022", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionPreviewDataList = [Transaction](repeating: transactionPreviewData, count: 10)
