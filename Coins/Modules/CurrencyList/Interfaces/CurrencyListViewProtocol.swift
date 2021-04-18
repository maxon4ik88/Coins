//
//  CurrencyListViewProtocol.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

protocol CurrencyListViewProtocol: class {
    func setupView()
    func firstLoadCells(with currencies: CurrencyList)
    func updateCells(with currencies: CurrencyList)
    func scrollLoadCells(with newCurriencies: CurrencyList)
}
