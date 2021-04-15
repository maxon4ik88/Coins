//
//  CurrencyListViewController.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import UIKit

class CurrencyListViewController: UIViewController, CurrencyListViewProtocol {

    private var refreshControl: UIRefreshControl!
    var isFetching = false
    
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

// MARK: - FirstLoadCells

extension CurrencyListViewController {
    
    func firstLoadCells(_ currencies: CurrencyList) {
        self.currencies = currencies
        mainTableView.reloadData()
    }
}

// MARK: - UpdateCells

extension CurrencyListViewController {
    
    func updateCells(_ currencies: CurrencyList) {
        self.currencies = currencies
        refreshControl.endRefreshing()
        mainTableView.reloadData()
    }
}

// MARK: - ScrollLoadCells

extension CurrencyListViewController {
    
    func scrollLoadCells(_ curriencies: [CurrencyData]?) {
        guard let models = currencies?.data else { return }
        self.currencies?.data! += models
        isFetching = false
        mainTableView.reloadData()
    }
}

// MARK: -  SetupRefreshControl

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

// MARK: - SetupScrolling

extension CurrencyListViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y + scrollView.frame.size.height > scrollView.contentSize.height) && !isFetching {
            isFetching.toggle()
            presenter.scrollLoadViewCells()
        }
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
