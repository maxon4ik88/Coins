//
//  Quote.swift
//  Coins
//
//  Created by Maxim on 19.04.2021.
//

struct Quote: Codable {
    let usd: Usd?

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}
