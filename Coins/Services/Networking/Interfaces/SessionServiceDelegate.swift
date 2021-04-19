//
//  SessionServiceDelegate.swift
//  Coins
//
//  Created by Maxim on 19.04.2021.
//

import Foundation

protocol SessionServiceDelegate: class {
    func dataDidReceived(_ SessionService: SessionService, with CurrencyModel: Data)
}
