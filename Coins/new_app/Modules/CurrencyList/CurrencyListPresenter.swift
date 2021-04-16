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
        interactor.networking(with: .updateData)
    }
    
    func configureView() {
        interactor.networking(with: .firstLoad)
        view.setupTableView()
        view.setupRefreshControl()
    }
    
    func scrollLoadViewCells() {
        counter.loadType = .scrollLoad
        interactor.networking(with: .scrollLoad)
    }
    
    func currenciesDidReceive(_ currencies: CurrencyList, with type: SessionManager.SessionType) {
        switch type {
        case .firstLoad:
            view.firstLoadCells(currencies)
        case .scrollLoad:
            view.scrollLoadCells(currencies)
        case .updateData:
            view.updateCells(currencies)
        }
    }
}
