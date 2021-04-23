//
//  CurrencyListModule.swift
//  Coins
//
//  Created by Maxim on 22.04.2021.
//

import UIKit

final class CurrencyListModule: ModuleInterface {
    
    // MARK: - ModuleInterface
    typealias Presenter = CurrencyListPresenter
    typealias Interactor = CurrencyListInteractor
    typealias View = CurrencyListViewController
    
    // MARK: - Public (Interface)
    func build() -> UIViewController {
        let presenter = Presenter()
        let interactor = Interactor()
        let view = View()
        
        view.presenter = presenter
        presenter.view = view
        
        assemble(presenter: presenter, interactor: interactor)
        
        return view
    }
}
