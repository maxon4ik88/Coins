//
//  Usd.swift
//  Coins
//
//  Created by Maxim on 19.04.2021.
//

struct Usd: Codable {
    let price, percentChange1H: Double?

    enum CodingKeys: String, CodingKey {
        case price
        case percentChange1H = "percent_change_1h"
    }
}
