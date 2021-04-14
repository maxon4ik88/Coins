//
//  CurrencyListPresenter.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import Foundation

protocol CurrencyListPresenterProtocol: class {
//    var currencies: CurrencyList? { get set }
    func configureView()
    func currenciesDidReceive(_ currencies: CurrencyList)
}

class CurrencyListPresenter: CurrencyListPresenterProtocol {
    
    weak var view: CurrencyListViewProtocol!
    var interactor: CurrencyListInteractorProtocol!
    
    required init(view: CurrencyListViewProtocol) {
        self.view = view
    }
    
    var currencies: CurrencyList?
    
    func configureView() {
        print("PRESENTOR: ConfigureView")
        interactor.networking()
        view.setupTableView()
    }
    
    func currenciesDidReceive(_ currencies: CurrencyList) {
//        self.currencies = currencies
        view.updateCells(currencies)
        
//        guard let currencies = self.currencies else { return }
//        view.updateCells(currencies)
    }
}
