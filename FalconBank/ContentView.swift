//
//  ContentView.swift
//  FalconBank
//
//  Created by Roy Falk on 26/04/2023.
//

import SwiftUI

struct ContentView: View {
    var transactions: [Transaction] = []
    var body: some View {
        NavigationView {
            List{
                HStack {
                    Spacer()
                    AmountView(amount: -700)
                    Spacer()
                }
                
                ForEach(transactions) { transaction in
                    TransactionView(transaction: transaction)
                }.navigationTitle("Transactions")
            }
                
            Text("Select a transaction").font(.largeTitle)
        }
    }
}

struct TransactionView: View {
    var transaction: Transaction
    var body: some View {
        NavigationLink(destination: TransactionDetail(transaction: transaction)) {
            HStack {
                Image(systemName: "photo")
                VStack(alignment: .leading) {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text(transaction.description)

                    AmountView(amount: transaction.value).font(.subheadline)
                        
                }
                .padding()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(transactions: mockDate)
    }
}




