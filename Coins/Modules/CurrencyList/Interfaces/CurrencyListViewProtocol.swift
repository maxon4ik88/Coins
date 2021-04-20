//
//  CurrencyListViewProtocol.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

protocol CurrencyListViewProtocol: class {
    func setupView()
    func didLoadView(with currencies: [Currency])
    func didRefreshView(with currencies: [Currency])
    func didScrollView(with currencies: [Currency])
}
