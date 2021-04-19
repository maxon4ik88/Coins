//
//  CurrencyListInteractorProtocol.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

protocol CurrencyListInteractorProtocol: class {
    func sendRequestToService(with task: CurrencyService.TaskType)
}
