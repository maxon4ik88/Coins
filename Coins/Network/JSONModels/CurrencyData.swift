//
//  CurrencyData.swift
//  Coins
//
//  Created by Maxim on 19.04.2021.
//

struct CurrencyData: Codable {
    let name: String?
    let quote: Quote?

    enum CodingKeys: String, CodingKey {
        case name
        case quote
    }
}
