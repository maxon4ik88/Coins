//
//  CurrencyListViewProtocol.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

protocol CurrencyListViewProtocol: class {
    func setupView()
    func initializeCells(with currencies: [CurrencyData])
    func refreshCells(with currencies: [CurrencyData])
    func didScrollCells(with currencies: [CurrencyData])
}
