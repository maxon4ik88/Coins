//
//  CurrencyServiceDelegate.swift
//  Coins
//
//  Created by Maxim on 19.04.2021.
//

protocol CurrencyServiceDelegate: class {
    func receivedDataFromService(_: CurrencyService, with currencyArray: [Currency], to task: CurrencyService.TaskType)
}
