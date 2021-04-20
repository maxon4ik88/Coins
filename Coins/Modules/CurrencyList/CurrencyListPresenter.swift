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
    func fetchRequest(with taskType: CurrencyService.TaskType) {
        interactor.sendRequestToService(with: taskType)
    }
    
    func updateViewData(with currencyArray: [Currency]) {
        let task = CurrencyListCounter.shared.taskType
        
        DispatchQueue.main.async {
            switch task {
            case .load:
                self.view.finishLoad(with: currencyArray)
            case .scroll:
                self.view.finishScroll(with: currencyArray)
            case .update:
                self.view.finishRefresh(with: currencyArray)
            case .none:
                return
            }
        }
    }
}
