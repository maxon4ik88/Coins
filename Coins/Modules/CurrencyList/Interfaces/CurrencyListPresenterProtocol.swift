//
//  CurrencyListPresenterProtocol.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

protocol CurrencyListPresenterProtocol: class {
    func fetchRequest(with taskType: CurrencyService.TaskType)
    func updateViewData(with currencyArray: [Currency])
}
