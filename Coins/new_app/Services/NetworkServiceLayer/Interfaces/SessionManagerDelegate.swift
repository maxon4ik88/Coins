//
//  SessionManagerDelegate.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

import Foundation

protocol SessionManagerDelegate: class {
    func firstLoad(_: SessionManager, with currencyData: CurrencyList?)
    func scrollLoad(_: SessionManager, with currencyData: CurrencyList?)
    func refreshLoad(_: SessionManager, with currencyData: CurrencyList?)
}
