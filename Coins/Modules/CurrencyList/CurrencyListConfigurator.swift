//
//  CurrencyListConfigurator.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import Foundation

class CurrencyListConfigurator: CurrencyListConfiguratorProtocol {
    
    // MARK: CurrencyListConfiguratorProtocol
    func configure(with viewController: CurrencyListViewController) {
        let presenter = CurrencyListPresenter(view: viewController)
        let interactor = CurrencyListInteractor(presenter: presenter)
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
