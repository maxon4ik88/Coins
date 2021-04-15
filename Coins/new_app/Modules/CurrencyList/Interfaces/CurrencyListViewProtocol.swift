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
    func firstLoadCells(_ currencies: CurrencyList)
    func updateCells(_ currencies: CurrencyList)
    func scrollLoadCells(_ curriencies: [CurrencyData]?)
    func setupRefreshControl()
}
