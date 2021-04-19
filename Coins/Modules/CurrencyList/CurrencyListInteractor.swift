//
//  CurrencyListInteractor.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

class CurrencyListInteractor: CurrencyListInteractorProtocol {
    
    // MARK: - Public (Properties)
    weak var presenter: CurrencyListPresenterProtocol!
    
    private var network: NetworkService?
    
    // MARK: - Init
    required init(presenter: CurrencyListPresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - CurrencyListInteractorProtocol
    func downloadCurrencies(with type: NetworkService.LoadType) {
        network = NetworkService(with: type)
        network?.delegate = self
        network?.startTask()
    }
}

// MARK: - SessionManagerDelegate
extension CurrencyListInteractor: NetworkServiceDelegate {
    func firstLoad(_: NetworkService, with currencyData: CurrencyList?) {
        guard let parsedModel = currencyData else { return }
        presenter.currenciesDidReceive(currencies: parsedModel, with: .firstLoad)
    }
    
    func scrollLoad(_: NetworkService, with currencyData: CurrencyList?) {
        guard let parsedModel = currencyData else { return }
        presenter.currenciesDidReceive(currencies: parsedModel, with: .scrollLoad)
    }
    
    func refreshLoad(_: NetworkService, with currencyData: CurrencyList?) {
        guard let parsedModel = currencyData else { return }
        presenter.currenciesDidReceive(currencies: parsedModel, with: .updateData)
    }
}
