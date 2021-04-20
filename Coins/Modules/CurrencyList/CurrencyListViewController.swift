//
//  CurrencyListViewController.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import UIKit

final class CurrencyListViewController: UIViewController, CurrencyListViewProtocol {
    
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
    
    private var currencyArray: [Currency] = []
    private var isFetching = false
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.fetchRequest(with: .load)
    }
    
    // MARK: - CurrencyListViewProtocol
    func finishLoad(with currencies: [Currency]) {
        currencyArray = currencies
        mainTableView.reloadData()
    }
    
    func finishRefresh(with currencies: [Currency]) {
        currencyArray = currencies
        refreshControl.endRefreshing()
        mainTableView.reloadData()
    }
    
    func finishScroll(with currencies: [Currency]) {
        currencyArray += currencies
        isFetching = false
        mainTableView.reloadData()
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
            mainTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mainTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            mainTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
    
    @objc private func updateData() {
        presenter.fetchRequest(with: .update)
    }
}

// MARK: - UITableViewDataSource
extension CurrencyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return currencyArray.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard currencyArray.count >= 0, indexPath.section == 0 else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyLoadCellModel.cellIdentifier,
                                                     for: indexPath) as! CurrencyLoadViewCell
            let cellModel = CurrencyLoadCellModel()
            cell.cellModel = cellModel
            
            return cell
        }
        
        let currency = currencyArray[indexPath.row]
        let cellModel = CurrencyMainCellModel(currency: currency)
        let cell = mainTableView.dequeueReusableCell(withIdentifier: CurrencyMainCellModel.cellIdentifier,
                                                     for: indexPath) as! CurrencyMainViewCell
        cell.cellModel = cellModel
        
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
        let currentPosition = scrollView.contentOffset.y + scrollView.frame.size.height
        let availableSpace = scrollView.contentSize.height
        
        if (currentPosition > availableSpace) && !isFetching {
            isFetching.toggle()
            presenter.fetchRequest(with: .scroll)
        }
    }
}
