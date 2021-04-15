//
//  CurrencyListInteractorProtocol.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

import Foundation

protocol CurrencyListInteractorProtocol: class {
    func networking(with type: SessionManager.SessionType)
}
