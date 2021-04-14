//
//  CurrencyListPresenterProtocol.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

import Foundation

protocol CurrencyListPresenterProtocol: class {
    func configureView()
    func currenciesDidReceive(_ currencies: CurrencyList)
}
