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
    var isFetching: Bool { get set }
    func setupTableView()
    func firstLoadCells(with currencies: CurrencyList)
    func updateCells(with currencies: CurrencyList)
    func scrollLoadCells(with newCurriencies: CurrencyList)
    func setupRefreshControl()
}
