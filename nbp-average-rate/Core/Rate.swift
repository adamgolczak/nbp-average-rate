//
//  Rate.swift
//  nbp-average-rate
//
//  Created by Adam Golczak on 05/05/2024.
//

import Foundation

struct Rate: Codable, Identifiable, Hashable {
    let id = UUID()
    let tableNumber: String
    let date: String
    let currencies: [Currency]

    private enum CodingKeys: String, CodingKey {
        case tableNumber = "no"
        case date = "effectiveDate"
        case currencies = "rates"
    }
}

struct Currency: Codable, Identifiable, Hashable {
    let id = UUID()
    let name: String
    let code: String
    let value: Double

    private enum CodingKeys: String, CodingKey {
        case code
        case name = "currency"
        case value = "mid"
    }
}
