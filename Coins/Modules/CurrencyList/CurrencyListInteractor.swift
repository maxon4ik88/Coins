//
//  CurrencyListInteractor.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

final class CurrencyListInteractor: CurrencyListInteractorProtocol {
    
    // MARK: - Public (Properties)
    weak var presenter: CurrencyListPresenterProtocol!
    
    // MARK: - Private (Properties)
    private var currencyService = CurrencyService()
    
    // MARK: - Init
    required init(presenter: CurrencyListPresenterProtocol) {
        self.presenter = presenter
        currencyService.delegate = self
    }
    
    // MARK: - CurrencyListInteractorProtocol
    func loadCurrencies(with taskType: CurrencyService.TaskType) {
        currencyService.fetchCurrencies(for: taskType)
    }
}

// MARK: - CurrencyServiceDelegate
extension CurrencyListInteractor: CurrencyServiceDelegate {
    func startTask(fromService: NetworkService, with currencies: [Currency], after taskType: CurrencyService.TaskType) {
        presenter.update(currencies: currencies, after: taskType)
    }
}
