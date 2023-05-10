//
//  Mock.swift
//  FalconBank
//
//  Created by Roy Falk on 27/04/2023.
//

import Foundation
import CoreLocation
import UIKit

let START_YEAR = 2020

func generateAllMockDate() {
    generateCreditCards()
    descriptions = getTransactionsStringsFromFile()
}

func getTransactionsStringsFromFile() -> [String] {
    var array = [String]()
    let path = Bundle.main.path(forResource: "Transactions", ofType: "txt")
    do {
        let content = try String(contentsOfFile: path!)
        let transactions = content.split(separator: "\n")
        for transaction in transactions {
            array.append(String(transaction))
        }
    } catch {
        // Do nothing
    }
    return array
}
var descriptions:[String] = [String]()
               
let creditCardProviders = ["Visa", "MasterCard", "American Express", "Diners Club", "Discover"]
let monthlyPayments = ["Water Bill", "Electricity Bill", "Municipal Tax", "Cable Provider Bill",
    "Mobile Plan", "Internet Plan"]
let randomPayments = ["Venmo", "Bit", "Paybox", "Pango", "Cellopark", "ATM withdrawal"]

func generateCreditCards() {
    for _ in 0...Int.random(in: 3...6) {
        mockCreditCards.append(CreditCard())
    }
}

func generateCreditCardCharges() {
    for card in mockCreditCards {
        
    }
}

func generateRandomTransactionsForDay(date:Date)->[Transaction] {
    var transactions = [Transaction]()
    let numTransactions = Int.random(in: 0...10)
    
    if numTransactions == 10 {
        transactions.append(generateTransaction(date: date))
    }
    
    if numTransactions > 8 {
        transactions.append(generateTransaction(date: date))
    }
    
    if numTransactions > 5 {
        transactions.append(generateTransaction(date: date))
    }
    
    return transactions
}

func generateTransaction(date:Date)->Transaction {
    return Transaction(date: date, description: descriptions[Int.random(in: 0..<descriptions.count)], value: Float.random(in: -2500 ... -1))
}

func generateRandomDate()-> Date {
    let calendar = Calendar.current
    let startDateComponents = DateComponents(calendar: calendar,
                                        year: START_YEAR,
                                        month: 1,
                                        day: 1)
    let currentDate = Date()
    let startDate = startDateComponents.date
    let startDateInt = Int(startDate!.timeIntervalSince1970)
    let currentDateInt = Int(currentDate.timeIntervalSince1970)
    let randomDateInt = Int.random(in: startDateInt...currentDateInt)
    
    let date = Date(timeIntervalSince1970: TimeInterval(randomDateInt))
    return date
}

struct CreditCard: Identifiable {
    var id = UUID()
    var provider: String
    var endsWith: String
    var CCV2: String
    var pin: String
    var created: Date
    var transactions: [Transaction]
    
    
    init() {
        provider = creditCardProviders[Int.random(in: 0...4)]
        endsWith = String(format: "%04d", Int.random(in: 0...9999))
        CCV2 = String(format: "%03d", Int.random(in: 0...999))
        pin = String(format: "%04d", Int.random(in: 0...9999))
        created = generateRandomDate()
        transactions = [Transaction]()
    }
}

struct Transaction: Identifiable {
    var id = UUID()
    var date: Date
    var description: String
    var value: Float
}

var mockCreditCards : [CreditCard] = []
    


let mockDate = [
    Transaction(date: Date(timeIntervalSinceReferenceDate: TimeInterval(-5)), description: "Visa Charges", value: -1500),
    Transaction(date: Date(timeIntervalSinceReferenceDate: TimeInterval(-5)), description: "Electricity Bill", value: -500),
    Transaction(date: Date(timeIntervalSinceReferenceDate: TimeInterval(-5)), description: "Water Bill", value: -250),
    Transaction(date: Date(timeIntervalSinceReferenceDate: TimeInterval(-5)), description: "Salary", value: 2500)
]


struct Branch : Identifiable {
    var id = UUID()
    var name: String
    var location: CLLocation
}



let mockBranches = [
    Branch(name: "Revivim Garden", location: CLLocation(latitude: 32.117440, longitude: 34.832067)),
    Branch(name: "Leah Goldberg", location: CLLocation(latitude: 32.120047, longitude: 34.820650)),
    Branch(name: "Bakery", location: CLLocation(latitude: 32.116747, longitude: 34.826897)),
    Branch(name: "Lady Davis", location: CLLocation(latitude: 32.116334, longitude: 34.817787))
]
