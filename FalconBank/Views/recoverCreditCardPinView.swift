//
//  RecoverCreditCardPinView.swift
//  FalconBank
//
//  Created by Roy Falk on 01/05/2023.
//

import SwiftUI

struct RecoverCreditCardPinView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image(systemName: "creditcard.trianglebadge.exclamationmark").imageScale(.large)
                    Text("Recover Security Pin").bold().font(.title2)
                }
                List {
                    ForEach(mockCreditCards) {
                        creditCard in
                        NavigationLink(destination: TimedPinView(creditCard: creditCard)) {
                            Text("\(creditCard.provider) ending with \(creditCard.endsWith)")
                        }
                    }
                }
            }
        }
    }
}

struct RecoverCreditCardPinView_Previews: PreviewProvider {
    static var previews: some View {
        RecoverCreditCardPinView()
    }
}
