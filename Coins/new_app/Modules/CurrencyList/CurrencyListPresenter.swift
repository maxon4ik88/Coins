//
//  CurrencyListPresenter.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import Foundation

protocol CurrencyListPresenterProtocol: class {
    func configureView()
}

class CurrencyListPresenter: CurrencyListPresenterProtocol {
    
    weak var view: CurrencyListViewProtocol!
    var interactor: CurrencyListInteractorProtocol!
    
    required init(view: CurrencyListViewProtocol) {
        self.view = view
    }
    
    func configureView() {
        
    }
}
