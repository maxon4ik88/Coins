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
        print("INTERACTOR(firstLoad): Models count is - \(parsedModel.data?.count ?? -1)")
        self.presenter.currenciesDidReceive(parsedModel, with: .firstLoad)
    }
    
    func scrollLoad(_: SessionManager, data: CurrencyList?) {
        guard let parsedModel = data else { return }
        print("INTERACTOR(scrollLoad): Models count is - \(parsedModel.data?.count ?? -1)")
        self.presenter.currenciesDidReceive(parsedModel, with: .scrollLoad)
    }
    
    func refreshLoad(_: SessionManager, data: CurrencyList?) {
        guard let parsedModel = data else { return }
        self.presenter.currenciesDidReceive(parsedModel, with: .updateData)
    }
}
