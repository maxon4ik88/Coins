//
//  CurrencyListViewProtocol.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

protocol CurrencyListViewProtocol: class {
    func updateTableView(with currencies: [Currency], after taskType: CurrencyService.TaskType)
}
