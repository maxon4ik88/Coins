//
//  CurrencyListViewController.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import UIKit

class CurrencyListViewController: UIViewController, CurrencyListViewProtocol {
    
    var mainTableView: UITableView!
    var currencies: CurrencyList?

    var presenter: CurrencyListPresenterProtocol!
    let configurator: CurrencyListConfiguratorProtocol = CurrencyListConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        presenter.configureView()
    }
    
}

// MARK: - TableView ReloadData

extension CurrencyListViewController {
    
    func updateCells(_ currencies: CurrencyList) {
        self.currencies = currencies
        mainTableView.reloadData()
    }
}

// MARK: - Setup TableView in controller

extension CurrencyListViewController {
    func setupTableView() {
        
        mainTableView = UITableView()
        mainTableView.backgroundColor = UIColor.white
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        let tableViewLoadingCellNib = UINib(nibName: "LoadingTableViewCell", bundle: nil)
        mainTableView.register(tableViewLoadingCellNib, forCellReuseIdentifier: "loadingCell")

        mainTableView.register(CurrencyMainCell.self, forCellReuseIdentifier: "CurrencyCell")

        view.addSubview(mainTableView)

        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mainTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            mainTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
}
