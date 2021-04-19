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
    
    // MARK: - Private (Properties)
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self,
                                 action: #selector(updateData),
                                 for: .valueChanged)
        
        return refreshControl
    }()
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(CurrencyLoadCell.self, forCellReuseIdentifier: LoadCellModel.cellIdentifier)
        tableView.register(CurrencyMainCell.self, forCellReuseIdentifier: MainCellModel.cellIdentifier)
        
        return tableView
    }()
    
    private var currencies: CurrencyList?
    private var isFetching = false
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.configureView()
    }
    
    // MARK: - CurrencyListViewProtocol
    func setupView() {
        addSubviews()
        addLayouts()
    }
    
    func firstLoadCells(with currencies: CurrencyList) {
        self.currencies = currencies
        mainTableView.reloadData()
    }
    
    func updateCells(with currencies: CurrencyList) {
        self.currencies = currencies
        refreshControl.endRefreshing()
        mainTableView.reloadData()
    }
    
    func scrollLoadCells(with newCurrencies: CurrencyList) {
        guard let models = newCurrencies.data else { return }
        
        currencies?.data! += models
        isFetching = false
        mainTableView.reloadData()
    }
    
    // MARK: - Private (Interface)
    private func addSubviews() {
        view.addSubview(mainTableView)
        mainTableView.addSubview(refreshControl)
    }
    
    private func addLayouts() {
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mainTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            mainTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
    
    @objc private func updateData() {
        presenter.updateViewCells()
    }
}

// MARK: - UITableViewDataSource
extension CurrencyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            guard let currencyDataCount = currencies?.data?.count, currencyDataCount > 0 else { return 0 }
            return currencyDataCount
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currencies = currencies, let data = currencies.data, indexPath.section == 0 else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: LoadCellModel.cellIdentifier, for: indexPath) as! CurrencyLoadCell
            let model = LoadCellModel()
            cell.model = model
            
            return cell
        }
        
        let model = MainCellModel(data[indexPath.row])
        let cell = mainTableView.dequeueReusableCell(withIdentifier: MainCellModel.cellIdentifier, for: indexPath) as! CurrencyMainCell
        cell.model = model
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CurrencyListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CustomHeaderView(frame: CGRect(x: 0, y: 0,
                                                        width: tableView.frame.size.width,
                                                        height: tableView.frame.size.height))
        headerView.backgroundColor = .systemGray6
        return section == 0 ? headerView : nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 30 : CGFloat.leastNonzeroMagnitude
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { 2 }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y + scrollView.frame.size.height > scrollView.contentSize.height) && !isFetching {
            isFetching.toggle()
            presenter.scrollLoadViewCells()
        }
    }
}
