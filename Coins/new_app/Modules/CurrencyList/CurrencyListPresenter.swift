//
//  CurrencyListPresenter.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import Foundation

class CurrencyListPresenter: CurrencyListPresenterProtocol {
    
    weak var view: CurrencyListViewProtocol!
    var interactor: CurrencyListInteractorProtocol!
    
    required init(view: CurrencyListViewProtocol) {
        self.view = view
    }
    
    var currencies: CurrencyList?
    
    func configureView() {
        
        interactor.networking()
        view.setupTableView()
    }
    
    func currenciesDidReceive(_ currencies: CurrencyList) {
        
        view.updateCells(currencies)
    }
}
