//
//  JSONModel.swift
//  Coins
//
//  Created by Maxon on 07.03.2021.
//

import Foundation

// MARK: - CurrencyList
struct CurrencyList: Codable {
    var data: [CurrencyData]?
}

// MARK: - Data
struct CurrencyData: Codable {
    let name: String?
    let quote: Quote?

    enum CodingKeys: String, CodingKey {
        case name
        case quote
    }
}

// MARK: - Quote
struct Quote: Codable {
    let usd: Usd?

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

// MARK: - Usd
struct Usd: Codable {
    let price, percentChange1H: Double?

    enum CodingKeys: String, CodingKey {
        case price
        case percentChange1H = "percent_change_1h"
    }
}
