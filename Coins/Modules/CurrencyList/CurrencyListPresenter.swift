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
    func configureView() {
        view.setupView()
        interactor.sendRequestToService(with: .load)
    }
    
    func willRefreshView() {
        interactor.sendRequestToService(with: .update)
    }
    
    func willScrollView() {
        interactor.sendRequestToService(with: .scroll)
    }
    
    func didReceived(currencies currenciesArray: [Currency], with task: CurrencyService.TaskType) {
        DispatchQueue.main.async {
            switch task {
            case .load:
                self.view.didLoadView(with: currenciesArray)
            case .scroll:
                self.view.didScrollView(with: currenciesArray)
            case .update:
                self.view.didRefreshView(with: currenciesArray)
            }
        }
    }
}
