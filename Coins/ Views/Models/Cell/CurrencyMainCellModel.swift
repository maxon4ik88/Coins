//
//  CurrencyMainCellModel.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

final class CurrencyMainCellModel: CellIdentifiable {
    
    // MARK: - Public (Properties)
    var name: String
    var price: String
    var changing: Double
    
    // MARK: - CellIdentifiable
    static var identifier: String = "CurrencyCell" 
    
    // MARK: - Init
    init(currency: Currency) {
        let name = currency.name ?? "no_data"
        let price = currency.quote?.usd?.price ?? 0.0
        let changing = currency.quote?.usd?.percentChange1H ?? 0.0
        
        self.name = name
        self.price = "\(price.rounded(to: 2))$"
        self.changing = changing
    }
}
