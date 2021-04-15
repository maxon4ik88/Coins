//
//  CurrencyCellModel.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

import Foundation

class CurrencyCellModel: BaseCellModel {
    
    override var cellIdentifier: String {
        return "CurrencyCell"
    }
    
    var currencyName: String
    var currencyPrice: String
    var currencyPriceChanging: Double
    
    init(_ currency: CurrencyData?) {
        currencyName = currency?.name ?? "no_data"
        currencyPrice = "\(currency?.quote?.usd?.price?.rounded(to: 2) ?? 0)$"
        currencyPriceChanging = currency?.quote?.usd?.percentChange1H ?? 0
    }
}

