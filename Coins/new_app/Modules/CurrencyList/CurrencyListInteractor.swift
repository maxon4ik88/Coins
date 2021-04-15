//
//  CurrencyListInteractor.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import Foundation

class CurrencyListInteractor: CurrencyListInteractorProtocol {
    
    weak var presenter: CurrencyListPresenterProtocol!
    
    required init(presenter: CurrencyListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func networking(with type: SessionManager.SessionType) {
        
        let network = NetworkService(with: type)
        network.delegate = self
        network.startTask()
    }
}

// MARK: - SessionManagerDelegate

extension CurrencyListInteractor: SessionManagerDelegate {
    func firstLoad(_: SessionManager, data: CurrencyList?) {
        guard let parsedModel = data else { return }
        self.presenter.currenciesDidReceive(parsedModel, with: .firstLoad)
    }
    
    func scrollLoad(_: SessionManager, data: CurrencyList?) {
        guard let parsedModel = data else { return }
        self.presenter.currenciesDidReceive(parsedModel, with: .scrollLoad)
    }
    
    func refreshLoad(_: SessionManager, data: CurrencyList?) {
        guard let parsedModel = data else { return }
        self.presenter.currenciesDidReceive(parsedModel, with: .updateData)
    }
}

//    func scrollLoad(_: NetworkManager, data: CurrencyList?) {
//        guard let parsedModel = data else { return }
//        guard let models = parsedModel.data else { return }
//
//        self.currencyList?.data! += models
//
//        self.isFetching = false
//
//        self.tableView.reloadData()
//    }


//extension CoinsListTableViewController: NetworkManagerDelegate {
//    
//    func firstLoad(_: NetworkManager, data: CurrencyList?) {
//        guard let parsedModel = data else { return }
//        
//        self.currencyList = parsedModel
//        
//        self.isFetching = false
//        
//        self.tableView.reloadData()
//    }
//    
//    func scrollLoad(_: NetworkManager, data: CurrencyList?) {
//        guard let parsedModel = data else { return }
//        guard let models = parsedModel.data else { return }
//        
//        self.currencyList?.data! += models
//        
//        self.isFetching = false
//        
//        self.tableView.reloadData()
//    }
//    
//    func refreshLoad(_: NetworkManager, data: CurrencyList?) {
//        guard let parsedModel = data else { return }
//        
//        self.currencyList = parsedModel
//        
//        self.isFetching = false
//        
//        self.refreshControl?.endRefreshing()
//        
//        self.tableView.reloadData()
//    }
//    
//}
