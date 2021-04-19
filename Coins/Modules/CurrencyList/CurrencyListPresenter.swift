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
    func updateViewCells() {
        counter.loadType = .update
        interactor.downloadCurrencies(with: .updateData)
    }
    
    func configureView() {
        view.setupView()
        interactor.downloadCurrencies(with: .firstLoad)
    }
    
    func scrollLoadViewCells() {
        counter.loadType = .scrollLoad
        interactor.downloadCurrencies(with: .scrollLoad)
    }
    
    func currenciesDidReceive(currencies: CurrencyList, with type: NetworkService.LoadType) {
        DispatchQueue.main.async {
            switch type {
            case .firstLoad:
                self.view.firstLoadCells(with: currencies)
            case .scrollLoad:
                self.view.scrollLoadCells(with: currencies)
            case .updateData:
                self.view.updateCells(with: currencies)
            }
        }
    }
}
