//
//  CurrencyListConfigurator.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import Foundation

protocol CurrencyListConfiguratorProtocol: class {
    func configure(with viewController: CurrencyListViewController)
}

class CurrencyListConfigurator: CurrencyListConfiguratorProtocol {
    
    func configure(with viewController: CurrencyListViewController) {
        
        let presenter = CurrencyListPresenter(view: viewController)
        let interactor = CurrencyListInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
