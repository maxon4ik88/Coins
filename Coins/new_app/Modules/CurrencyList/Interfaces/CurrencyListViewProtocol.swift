//
//  CurrencyListViewProtocol.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

import UIKit

protocol CurrencyListViewProtocol: class {
    var mainTableView: UITableView! { get }
    var currencies: CurrencyList? { get set }
    func setupTableView()
    func updateCells(_ currencies: CurrencyList)
}
