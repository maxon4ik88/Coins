//
//  CurrencyListPresenter.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import Foundation

final class CurrencyListPresenter: CurrencyListPresenterProtocol {
    
    // MARK: - Public (Properties)
    weak var view: CurrencyListViewProtocol!
    var interactor: CurrencyListInteractorProtocol!
    
    // MARK: - Init
    required init(view: CurrencyListViewProtocol) {
        self.view = view
    }
    
    // MARK: - CurrencyListPresenterProtocol
    func completeLoading(in taskType: CurrencyService.TaskType) {
        interactor.loadCurrencies(with: taskType)
    }
    
    func updateViewData(with currencyArray: [Currency]) {
        DispatchQueue.main.async {
            self.view.getCurrencies(currencies: currencyArray)
        }
    }
}
