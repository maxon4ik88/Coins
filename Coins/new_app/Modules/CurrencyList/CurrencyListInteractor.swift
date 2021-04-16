//
//  CurrencyListInteractor.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import Foundation

class CurrencyListInteractor: CurrencyListInteractorProtocol {
    
    // MARK: - Public (Properties)
    weak var presenter: CurrencyListPresenterProtocol!
    
    // MARK: - Init
    required init(presenter: CurrencyListPresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - CurrencyListInteractorProtocol
    func downloadCurrencies(with type: SessionManager.SessionType) {
        let network = NetworkService(with: type)
        network.delegate = self
        network.startTask()
    }
}

// MARK: - SessionManagerDelegate
extension CurrencyListInteractor: SessionManagerDelegate {
    func firstLoad(_: SessionManager, with currencyData: CurrencyList?) {
        guard let parsedModel = currencyData else { return }
        presenter.currenciesDidReceive(currencies: parsedModel, with: .firstLoad)
    }
    
    func scrollLoad(_: SessionManager, with currencyData: CurrencyList?) {
        guard let parsedModel = currencyData else { return }
        presenter.currenciesDidReceive(currencies: parsedModel, with: .scrollLoad)
    }
    
    func refreshLoad(_: SessionManager, with currencyData: CurrencyList?) {
        guard let parsedModel = currencyData else { return }
        presenter.currenciesDidReceive(currencies: parsedModel, with: .updateData)
    }
}
