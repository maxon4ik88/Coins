//
//  CurrencyServiceDelegate.swift
//  Coins
//
//  Created by Maxim on 19.04.2021.
//

protocol CurrencyServiceDelegate: class {
    func requestCompleted(_ service: CurrencyService, with currencyArray: [Currency], of task: CurrencyService.TaskType)
}
