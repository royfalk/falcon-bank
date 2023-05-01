//
//  recoverCreditCardPinView.swift
//  FalconBank
//
//  Created by Roy Falk on 01/05/2023.
//

import SwiftUI

struct recoverCreditCardPinView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "creditcard.trianglebadge.exclamationmark").imageScale(.large)
                Text("Recover Security Pin").bold().font(.title2)
            }
            List {
                ForEach(mockCreditCards) {
                    creditCard in
                    Text(creditCard.provider)
                    Text(creditCard.endsWith)
                }
            }
        }
        
    }
}

struct recoverCreditCardPinView_Previews: PreviewProvider {
    static var previews: some View {
        recoverCreditCardPinView()
    }
}
