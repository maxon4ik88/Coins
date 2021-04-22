//
//  CurrencyListInteractor.swift
//  Coins
//
//  Created by Maxim on 22.04.2021.
//

final class CurrencyListInteractor: InteractorInterface {
    
    // MARK: - Public (Properties)
    weak var presenter: CurrencyListPresenterInteractorInterface!
    
    // MARK: - Private (Properties)
    private let currencyService = CurrencyService()
}

// MARK: - CurrencyListInteractorPresentorInterface
extension CurrencyListInteractor: CurrencyListInteractorPresenterInterface {
    func loadCurrencies() {
        currencyService.delegate = self
        currencyService.fetchCurrencies()
    }
}

// MARK: - CurrencyServiceDelegate
extension CurrencyListInteractor: CurrencyServiceDelegate {
    func startTask(fromService: NetworkService, with currencies: [Currency]) {
        presenter.update(currencies: currencies)
    }
}
