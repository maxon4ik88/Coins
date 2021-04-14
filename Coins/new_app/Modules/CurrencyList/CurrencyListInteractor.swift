//
//  CurrencyListInteractor.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import Foundation

protocol CurrencyListInteractorProtocol: class {
    var endPoint: EndPoint { get }
//    var currencies: CurrencyList? { get }
    func openUrl(with urlString: String)
    func networking()
}

class CurrencyListInteractor: CurrencyListInteractorProtocol {
    
    weak var presenter: CurrencyListPresenterProtocol!
    
    required init(presenter: CurrencyListPresenterProtocol) {
        self.presenter = presenter
    }
    
    var endPoint: EndPoint {
        return EndPoint.loadLatestMarketData
    }
    
//    var currencies: CurrencyList?
    
    func openUrl(with urlString: String) {
        
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
//        self.currencies = parsedModel
//        self.presenter.currencies = parsedModel
        self.presenter.currenciesDidReceive(parsedModel)
    }
    
    func scrollLoad(_: NetworkManager, data: CurrencyList?) {
        guard let parsedModel = data else { return }
//        self.currencies = parsedModel
        print(parsedModel)
    }
    
    func refreshLoad(_: NetworkManager, data: CurrencyList?) {
        guard let parsedModel = data else { return }
//        self.currencies = parsedModel
        print(parsedModel)
    }
    
    
}
