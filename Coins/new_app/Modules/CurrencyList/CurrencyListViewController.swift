//
//  CurrencyListViewController.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import UIKit

protocol CurrencyListViewProtocol: class {}

class CurrencyListViewController: UIViewController, CurrencyListViewProtocol {
    
    var presenter: CurrencyListPresenterProtocol!
    let configurator: CurrencyListConfiguratorProtocol = CurrencyListConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        presenter.configureView()
    }

}
