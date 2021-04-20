//
//  CurrencySectionModel.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

final class CurrencySectionModel: SectionRowsRepresentable {

    // MARK: - SectionRowsRepresentable
    var rows: [CellIdentifiable]

    // MARK: - Init
    init(_ currency: CurrencyData?) {
        rows = [CellIdentifiable]()
        guard let currency = currency else { return }

        rows.append(CurrencyMainCellModel(currency: currency))
    }
}
