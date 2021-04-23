//
//  CurrencyListPresenter.swift
//  Coins
//
//  Created by Maxim on 22.04.2021.
//

import Foundation

final class CurrencyListPresenter: PresenterInterface {
    
    // MARK: - Public (Properties)
    var interactor: CurrencyListInteractorPresenterInterface!
    weak var view: CurrencyListViewController!
    
    // MARK: - Private (Properties)
    private let counter = CurrencyListCounter.shared
    
}

// MARK: - CurrencyListPresenterViewInterface
extension CurrencyListPresenter: CurrencyListPresenterViewInterface {
    func handleOnAppear() {
        counter.taskType = .appear
        interactor.loadCurrencies()
    }
    
    func updateAllCurrencies() {
        counter.taskType = .update
        interactor.loadCurrencies()
    }
    
    func loadNewCurrencies() {
        counter.taskType = .scroll
        interactor.loadCurrencies()
    }
}

// MARK: - CurrencyListPresenterInteractorInterface
extension CurrencyListPresenter: CurrencyListPresenterInteractorInterface {
    func update(currencies: [Currency]) {
        DispatchQueue.main.async { [weak self] in
            self?.view.updateTableView(with: currencies, after: (self?.counter.taskType)!)
        }
    }
}
