//
//  SectionModel.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

import Foundation

protocol CurrencySectionModelDelegate: class {}

class CurrencySectionModel: SectionRowsRepresentable {
    var rows: [CellIdentifiable]
    
    weak var delegate: CurrencySectionModelDelegate?
    
    init(_ currency: CurrencyData?) {
        rows = [CellIdentifiable]()
        
        guard let currency = currency else { return }
        
        rows.append(CurrencyCellModel(currency))
    }
}
