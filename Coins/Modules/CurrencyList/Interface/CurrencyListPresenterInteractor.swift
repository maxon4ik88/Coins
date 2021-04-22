//
//  CurrencyListPresenterInteractorInterface.swift
//  Coins
//
//  Created by Maxim on 22.04.2021.
//

import Foundation

protocol CurrencyListPresenterInteractorInterface: PresenterInteractorInterface{
    func update(currencies: [Currency])
}
