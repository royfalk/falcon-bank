//
//  Mock.swift
//  FalconBank
//
//  Created by Roy Falk on 27/04/2023.
//

import Foundation
import CoreLocation

struct Transaction: Identifiable {
    var id = UUID()
    var date: Date
    var description: String
    var value: Float
}


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
