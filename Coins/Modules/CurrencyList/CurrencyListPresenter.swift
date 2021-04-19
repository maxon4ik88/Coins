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
    func refreshViewCells() {
        interactor.sendRequestToService(with: .update)
    }
    
    func configureView() {
        view.setupView()
        interactor.sendRequestToService(with: .load)
    }
    
    func didScrollViewCells() {
        interactor.sendRequestToService(with: .scroll)
    }
    
    func didReceiveFromInteractor(parsedData: [CurrencyData], with type: CurrencyService.TaskType) {
        
        DispatchQueue.main.async {
            switch type {
            case .load:
                self.view.initializeCells(with: parsedData)
            case .scroll:
                self.view.didScrollCells(with: parsedData)
            case .update:
                self.view.refreshCells(with: parsedData)
            }
        }
    }
}
