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
    func sendRequestToService(with task: CurrencyService.TaskType) {
        currencyService.beginRequest(of: task)
    }
}

// MARK: - CurrencyServiceDelegate
extension CurrencyListInteractor: CurrencyServiceDelegate {
    func receivedDataFromService(_: CurrencyService, with currencyArray: [Currency], to task: CurrencyService.TaskType) {
        presenter.didReceived(currencies: currencyArray, with: task)
    }
}
