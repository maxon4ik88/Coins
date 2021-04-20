//
//  CurrencyListPresenterProtocol.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

protocol CurrencyListPresenterProtocol: class {
    func configureView()
    func willRefreshView()
    func willScrollView()
    func didReceived(currencies currencyArray: [Currency], with task: CurrencyService.TaskType)
}
