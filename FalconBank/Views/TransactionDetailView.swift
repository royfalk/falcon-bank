//
//  TransactionDetail.swift
//  FalconBank
//
//  Created by Roy Falk on 27/04/2023.
//

import SwiftUI

struct TransactionDetailView: View {
    @State private var zoomed: Bool = false
    var transaction: Transaction
    var body: some View {
        VStack {
            Text(transaction.description)
            Spacer(minLength: 0)
            
            Image("gold").resizable().aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                        zoomed.toggle()
                    }
                }
            Spacer(minLength: 0)
            
            if(!zoomed) {
                HStack {
                    Spacer()
                    Label("Dispute", systemImage: "flame.fill")
                    
                    Spacer()
                }.padding(.all)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.red/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .transition(.move(edge: .bottom))
            }
        }
        .navigationTitle("Detailes")
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct TransactionDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TransactionDetailView(transaction: mockDate[0])
        }
    }
}
