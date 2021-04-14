//
//  CoinsListTableViewController+NetworkManagerDelegate.swift
//  Coins
//
//  Created by Максим Шванов on 11.03.2021.
//

import UIKit


extension CoinsListTableViewController: NetworkManagerDelegate {
    
    func firstLoad(_: NetworkManager, data: CurrencyList?) {
        guard let parsedModel = data else { return }
        
        self.currencyList = parsedModel
        
        self.isFetching = false
        
        self.tableView.reloadData()
    }
    
    func scrollLoad(_: NetworkManager, data: CurrencyList?) {
        guard let parsedModel = data else { return }
        guard let models = parsedModel.data else { return }
        
        self.currencyList?.data! += models
        
        self.isFetching = false
        
        self.tableView.reloadData()
    }
    
    func refreshLoad(_: NetworkManager, data: CurrencyList?) {
        guard let parsedModel = data else { return }
        
        self.currencyList = parsedModel
        
        self.isFetching = false
        
        self.refreshControl?.endRefreshing()
        
        self.tableView.reloadData()
    }
    
}
