//
//  CurrencyListPresenterProtocol.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

protocol CurrencyListPresenterProtocol: class {
    func configureView()
    func updateViewCells()
    func scrollLoadViewCells()
    func currenciesDidReceive(currencies: CurrencyList, with type: SessionService.SessionType)
}
