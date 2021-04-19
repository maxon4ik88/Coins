//
//  CurrencyListInteractor.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

class CurrencyListInteractor: CurrencyListInteractorProtocol {
    
    // MARK: - Public (Properties)
    weak var presenter: CurrencyListPresenterProtocol!
    
    // MARK: - Private (Properties)
    private var network: NetworkService?
    
    // MARK: - Init
    required init(presenter: CurrencyListPresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - CurrencyListInteractorProtocol
    func downloadCurrencies(with type: NetworkService.LoadType) {
        network = NetworkService()
        network?.delegate = self
        network?.fetchData(of: .loadLatestMarketData, with: type)
    }
}

// MARK: - NetworkManagerDelegate
extension CurrencyListInteractor: NetworkServiceDelegate {
    func sentToInteractor(_: NetworkService, parsedData: CurrencyList?, with task: NetworkService.LoadType) {
        guard let parsedData = parsedData else { return }
        
        presenter.didReceiveFromInteractor(parsedData: parsedData, with: task)
    }
}
