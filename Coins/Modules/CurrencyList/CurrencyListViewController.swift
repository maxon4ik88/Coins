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
        refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
        
        return refreshControl
    }()
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(CurrencyLoadViewCell.self, forCellReuseIdentifier: CurrencyLoadCellModel.cellIdentifier)
        tableView.register(CurrencyMainViewCell.self, forCellReuseIdentifier: CurrencyMainCellModel.cellIdentifier)
        
        return tableView
    }()
    
    private var currencyArray: [CurrencyData]?
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
    
    func initializeCells(with currencies: [CurrencyData]) {
        currencyArray = currencies
        mainTableView.reloadData()
    }
    
    func refreshCells(with currencies: [CurrencyData]) {
        currencyArray = currencies
        refreshControl.endRefreshing()
        mainTableView.reloadData()
    }
    
    func didScrollCells(with currencies: [CurrencyData]) {
        if currencyArray != nil {
            currencyArray! += currencies
            isFetching = false
            mainTableView.reloadData()
        }
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
        presenter.refreshViewCells()
    }
}

// MARK: - UITableViewDataSource
extension CurrencyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            guard let currencyDataCount = currencyArray?.count, currencyDataCount > 0 else { return 0 }
            return currencyDataCount
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currencies = currencyArray, indexPath.section == 0 else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyLoadCellModel.cellIdentifier, for: indexPath) as! CurrencyLoadViewCell
            let model = CurrencyLoadCellModel()
            cell.model = model
            
            return cell
        }
        
        let model = CurrencyMainCellModel(currencies[indexPath.row])
        let cell = mainTableView.dequeueReusableCell(withIdentifier: CurrencyMainCellModel.cellIdentifier, for: indexPath) as! CurrencyMainViewCell
        cell.model = model
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CurrencyListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CurrencyHeaderView(frame: CGRect(x: 0, y: 0,
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
            presenter.didScrollViewCells()
        }
    }
}
