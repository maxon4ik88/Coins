//
//  CurrencyListViewProtocol.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

protocol CurrencyListViewProtocol: class {
    func finishLoad(with currencies: [Currency])
    func finishRefresh(with currencies: [Currency])
    func finishScroll(with currencies: [Currency])
}
