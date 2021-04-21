//
//  CurrencyServiceDelegate.swift
//  Coins
//
//  Created by Maxim on 21.04.2021.
//

import Foundation

protocol CurrencyServiceDelegate: class {
    func startTask(fromService: NetworkService, with currencies: [Currency], after taskType: CurrencyService.TaskType)
}
