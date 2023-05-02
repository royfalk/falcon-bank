//
//  TimedPinView.swift
//  FalconBank
//
//  Created by Roy Falk on 02/05/2023.
//

import SwiftUI

struct TimedPinView: View {
    @State var creditCard:CreditCard
    @State var progress: Int = 60
    @State var progressFraction: Float = 1.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "creditcard.trianglebadge.exclamationmark").imageScale(.large)
                Text("Recover Security Pin").bold().font(.title2)
            }
            Text("Your pin is \(creditCard.pin)").font(.headline).padding(.vertical)
            
            Text("Be sure to store this pin in a safe place and separate from your credit card.")
                .padding(.bottom)
            
            Text("This message will disappear in 60 seconds")
            
            ProgressView(value: progressFraction)
                .padding([.top, .leading, .trailing])
                .onReceive(timer) {
                    firedDate in
                    progress -= 1
                    progressFraction = Float(progress)/60.0
                    if(progress == 0) {
                        dismiss()
                    }
                }
            Spacer()
            
        }
        
    }
}

struct TimedPinView_Previews: PreviewProvider {
    static var previews: some View {
        TimedPinView(creditCard: CreditCard())
    }
}
