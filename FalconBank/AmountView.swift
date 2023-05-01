//
//  AmountText.swift
//  FalconBank
//
//  Created by Roy Falk on 27/04/2023.
//

import SwiftUI

func convertNumberToFormattedAmount(amount: Float) -> (String, Color) {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .currency
    let optionalFormattedAmount = numberFormatter.string(from: NSNumber(value: amount))
    if let formattedAmount = optionalFormattedAmount {
        return (formattedAmount, (amount >= 0 ? .primary : .red))
    }
    return ("err", .red)
}

struct AmountView: View {
    @State var amount: Float
    let formattedTuple: (String, Color)

    init(amount: Float) {
        self.amount = amount
        formattedTuple  = convertNumberToFormattedAmount(amount: amount)
    }
    var body: some View {
        Text("Current Balance: ")
        Text(formattedTuple.0)
            .foregroundColor(amount > 0 ? .primary : .red)
    }
}
