//
//  CurrencyListConfigurator.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

final class CurrencyListConfigurator: CurrencyListConfiguratorProtocol {
    
    // MARK: - CurrencyListConfiguratorProtocol
    func configure() -> CurrencyListViewController {
        let viewController = CurrencyListViewController()
        let presenter = CurrencyListPresenter(view: viewController)
        let interactor = CurrencyListInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        
        return viewController
    }
}
