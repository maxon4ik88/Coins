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
        currencyService.receiver = self
    }
    
    // MARK: - CurrencyListInteractorProtocol
    func loadCurrencies(with taskType: CurrencyService.TaskType) {
        currencyService.beginRequest(with: taskType)
    }
}

// MARK: - CurrencyServiceDelegate
extension CurrencyListInteractor: DataReceiverInterface {
    func startTask(_ fromService: NetworkService, with data: Any) {
        guard let currencies = data as? [Currency] else { return }
        
        presenter.updateViewData(with: currencies)
    }
}
