//
//  CurrencyListPresenter.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import Foundation

class CurrencyListPresenter: CurrencyListPresenterProtocol {
    
    // MARK: - Public (Properties)
    weak var view: CurrencyListViewProtocol!
    var interactor: CurrencyListInteractorProtocol!
    
    // MARK: - Private (Properties)
    private let counter = CurrencyListCounter.shared
    
    // MARK: - Init
    required init(view: CurrencyListViewProtocol) {
        self.view = view
    }
    
    // MARK: - CurrencyListPresenterProtocol
    func refreshViewCells() {
        counter.loadType = .update
        interactor.downloadCurrencies(with: .updateData)
    }
    
    func configureView() {
        view.setupView()
        counter.loadType = .firstLoad
        interactor.downloadCurrencies(with: .firstLoad)
    }
    
    func didScrollViewCells() {
        counter.loadType = .scrollLoad
        interactor.downloadCurrencies(with: .scrollLoad)
    }
    
    func didReceiveFromInteractor(parsedData: CurrencyList, with type: NetworkService.LoadType) {
        guard let currencies = parsedData.data else { return }
        
        DispatchQueue.main.async {
            switch type {
            case .firstLoad:
                self.view.initializeCells(with: currencies)
            case .scrollLoad:
                self.view.didScrollCells(with: currencies)
            case .updateData:
                self.view.refreshCells(with: currencies)
            }
        }
    }
}
