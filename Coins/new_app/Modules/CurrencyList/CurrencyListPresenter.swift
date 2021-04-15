//
//  CurrencyListPresenter.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import Foundation

class CurrencyListPresenter: CurrencyListPresenterProtocol {
    
    private let counter = CurrencyListCounter.shared
    
    weak var view: CurrencyListViewProtocol!
    var interactor: CurrencyListInteractorProtocol!
    
    required init(view: CurrencyListViewProtocol) {
        self.view = view
    }
    
    func updateViewCells() {
        counter.isUpdate = true
        interactor.networking(with: .updateData)
    }
    
    func configureView() {
        
        interactor.networking(with: .firstLoad)
        view.setupTableView()
        view.setupRefreshControl()
    }
    
    func scrollLoadViewCells() {
        counter.isUpdate = false
        interactor.networking(with: .scrollLoad)
    }
    
    func currenciesDidReceive(_ currencies: CurrencyList, with type: SessionManager.SessionType) {
        
        switch type {
        case .firstLoad:
            view.firstLoadCells(currencies)
        case .scrollLoad:
            guard let models = currencies.data else { return }
            view.scrollLoadCells(models)
        case .updateData:
            view.updateCells(currencies)
        }
    }
}
