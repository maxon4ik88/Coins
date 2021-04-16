//
//  CurrencyListViewController+UITableViewDataSource.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

import UIKit

extension CurrencyListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { 2 }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CustomHeaderView(frame: CGRect(x: 0, y: 0,
                                                        width: tableView.frame.size.width,
                                                        height: tableView.frame.size.height))
        headerView.backgroundColor = .systemGray6
        return section == 0 ? headerView : nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 30 : CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            guard let currencyDataCount = currencies?.data?.count, currencyDataCount > 0 else { return 0 }
            return currencyDataCount
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currencies = currencies, let data = currencies.data, indexPath.section == 0 else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! CurrencyLoadCell
            let model = LoadCellModel()
            cell.model = model
            return cell
        }
        
        let model = CurrencyCellModel(data[indexPath.row])
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyMainCell
        cell.model = model
        cell.backgroundColor = .white
        return cell
    }
}

