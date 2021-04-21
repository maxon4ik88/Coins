//
//  CurrencyListPresenterProtocol.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

protocol CurrencyListPresenterProtocol: class {
    func completeLoading(in taskType: CurrencyService.TaskType)
    func update(currencies: [Currency], after taskType: CurrencyService.TaskType)
}
