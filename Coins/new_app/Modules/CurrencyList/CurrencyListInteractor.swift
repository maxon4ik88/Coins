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
    
    func networking() {
        let network = NetworkManager()
        network.delegate = self
        
        network.newFetchCurrencies(with: .firstLoad)
    }
}

// MARK: - NetworkManagerDelegate

extension CurrencyListInteractor: NetworkManagerDelegate {
    func firstLoad(_: NetworkManager, data: CurrencyList?) {
        guard let parsedModel = data else { return }
        self.presenter.currenciesDidReceive(parsedModel)
    }
    
    func scrollLoad(_: NetworkManager, data: CurrencyList?) {
        guard let parsedModel = data else { return }
        print(parsedModel)
    }
    
    func refreshLoad(_: NetworkManager, data: CurrencyList?) {
        guard let parsedModel = data else { return }
        print(parsedModel)
    }
    
    
}
