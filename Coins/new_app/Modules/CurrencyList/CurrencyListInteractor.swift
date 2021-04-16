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
        presenter.currenciesDidReceive(parsedModel, with: .firstLoad)
    }
    
    func scrollLoad(_: SessionManager, data: CurrencyList?) {
        guard let parsedModel = data else { return }
        presenter.currenciesDidReceive(parsedModel, with: .scrollLoad)
    }
    
    func refreshLoad(_: SessionManager, data: CurrencyList?) {
        guard let parsedModel = data else { return }
        presenter.currenciesDidReceive(parsedModel, with: .updateData)
    }
}
