//
//  SessionManagerDelegate.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

import Foundation

protocol SessionManagerDelegate: class {
    func firstLoad(_: SessionManager, data: CurrencyList?)
    func scrollLoad(_: SessionManager, data: CurrencyList?)
    func refreshLoad(_: SessionManager, data: CurrencyList?)
}
