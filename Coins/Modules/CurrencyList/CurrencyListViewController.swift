//
//  CurrencyLIstViewController.swift
//  Coins
//
//  Created by Maxim on 22.04.2021.
//

import UIKit

final class CurrencyListViewController: UIViewController, ViewInterface {
    
    // MARK: - Public (Properties)
    var presenter: CurrencyListPresenterViewInterface!
    
    // MARK: - Private (Properties)
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(updateCurrencies), for: .valueChanged)
        
        return refreshControl
    }()
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(CurrencyLoadViewCell.self, forCellReuseIdentifier: CurrencyLoadCellModel.identifier)
        tableView.register(CurrencyMainViewCell.self, forCellReuseIdentifier: CurrencyMainCellModel.identifier)
        
        return tableView
    }()
    
    private var currencies: [Currency] = []
    private var isFetching = false
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.handleOnAppear()
    }
    
    // MARK: - CurrencyListViewProtocol
    func updateTableView(with currencies: [Currency], after taskType: CurrencyService.TaskType) {
        switch taskType {
        case .appear:
            completeAppear(with: currencies)
        case .scroll:
            completeScroll(with: currencies)
        case .update:
            completeRefresh(with: currencies)
        }
    }
  
    // MARK: - Private (Interface)
    private func setupView() {
        addSubviews()
        addLayouts()
    }
    
    private func addSubviews() {
        view.addSubview(mainTableView)
        mainTableView.addSubview(refreshControl)
    }
    
    private func addLayouts() {
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainTableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
    
    private func completeAppear(with currencies: [Currency]) {
        self.currencies = currencies
        mainTableView.reloadData()
    }
    
    private func completeRefresh(with currencies: [Currency]) {
        self.currencies = currencies
        refreshControl.endRefreshing()
        mainTableView.reloadData()
    }
    
    private func completeScroll(with currencies: [Currency]) {
        self.currencies += currencies
        isFetching = false
        mainTableView.reloadData()
    }
    
    @objc private func updateCurrencies() {
        presenter.updateAllCurrencies()
    }
}

// MARK: - UITableViewDataSource
extension CurrencyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? currencies.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard currencies.count >= 0, indexPath.section == 0 else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyLoadCellModel.identifier,
                                                     for: indexPath) as! CurrencyLoadViewCell
            let model = CurrencyLoadCellModel()
            cell.model = model
            
            return cell
        }
        
        let currency = currencies[indexPath.row]
        let model = CurrencyMainCellModel(currency: currency)
        let cell = mainTableView.dequeueReusableCell(withIdentifier: CurrencyMainCellModel.identifier,
                                                     for: indexPath) as! CurrencyMainViewCell
        cell.model = model
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CurrencyListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CurrencyHeaderView(frame: CGRect(x: 0.0, y: 0.0,
                                                          width: tableView.frame.size.width,
                                                          height: tableView.frame.size.height))
        headerView.backgroundColor = .systemGray6
        return section == 0 ? headerView : nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 30.0 : .leastNonzeroMagnitude
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { 2 }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPosition = scrollView.contentOffset.y + scrollView.frame.size.height
        let availableSpace = scrollView.contentSize.height
        
        if (currentPosition > availableSpace) && !isFetching {
            isFetching.toggle()
            presenter.loadNewCurrencies()
        }
    }
}
