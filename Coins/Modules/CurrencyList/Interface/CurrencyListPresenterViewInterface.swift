//
//  CurrencyListPresenterViewInterface.swift
//  Coins
//
//  Created by Maxim on 22.04.2021.
//

import Foundation

protocol CurrencyListPresenterViewInterface: PresenterViewInterface {
    func handleOnAppear()
    func updateAllCurrencies()
    func loadNewCurrencies()
}
