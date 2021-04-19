//
//  SectionModel.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

protocol CurrencySectionModelDelegate: class {}

class CurrencySectionModel: SectionRowsRepresentable {
    
    // MARK: - Public (Properties)
    weak var delegate: CurrencySectionModelDelegate?
    
    // MARK: - SectionRowsRepresentable
    var rows: [CellIdentifiable]
    
    // MARK: - Init
    init(_ currency: CurrencyData?) {
        rows = [CellIdentifiable]()
        guard let currency = currency else { return }
        rows.append(MainCellModel(currency))
    }
}
