//
//  CurrencyListViewController.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import UIKit

class CurrencyListViewController: UIViewController, CurrencyListViewProtocol {

    // MARK: - Public (Properties)
    var presenter: CurrencyListPresenterProtocol!
    
    // MARK: CurrencyListViewProtocol
    var isFetching = false
    var mainTableView: UITableView!
    var currencies: CurrencyList?
    
    // MARK: - Private (Properties)
    private let configurator: CurrencyListConfiguratorProtocol = CurrencyListConfigurator()
    private var refreshControl: UIRefreshControl!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
}

// MARK: - firstLoadCells
extension CurrencyListViewController {
    func firstLoadCells(with currencies: CurrencyList) {
        self.currencies = currencies
        mainTableView.reloadData()
    }
}

// MARK: - updateCells
extension CurrencyListViewController {
    func updateCells(with currencies: CurrencyList) {
        self.currencies = currencies
        refreshControl.endRefreshing()
        mainTableView.reloadData()
    }
}

// MARK: - scrollLoadCells
extension CurrencyListViewController {
    func scrollLoadCells(with newCurrencies: CurrencyList) {
        guard let models = newCurrencies.data else { return }
        currencies?.data! += models
        isFetching = false
        mainTableView.reloadData()
    }
}

// MARK: - setupRefreshControl
extension CurrencyListViewController {
    func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
        mainTableView.addSubview(refreshControl)
    }
    
    @objc private func updateData() {
        presenter.updateViewCells()
    }
}

// MARK: - scrollViewDidScroll
extension CurrencyListViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y + scrollView.frame.size.height > scrollView.contentSize.height) && !isFetching {
            isFetching.toggle()
            presenter.scrollLoadViewCells()
        }
    }
}

// MARK: - setupTableView
extension CurrencyListViewController {
    func setupTableView() {
        mainTableView = UITableView()
        mainTableView.backgroundColor = UIColor.white
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(CurrencyLoadCell.self, forCellReuseIdentifier: "LoadingCell")
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
