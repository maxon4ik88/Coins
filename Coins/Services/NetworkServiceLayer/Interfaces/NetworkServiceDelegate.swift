//
//  NetworkServiceDelegate.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

protocol NetworkServiceDelegate: class {
    func firstLoad(_: NetworkService, with currencyData: CurrencyList?)
    func scrollLoad(_: NetworkService, with currencyData: CurrencyList?)
    func refreshLoad(_: NetworkService, with currencyData: CurrencyList?)
}
