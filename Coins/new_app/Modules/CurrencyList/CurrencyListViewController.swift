//
//  CurrencyListViewController.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import UIKit

protocol CurrencyListViewProtocol: class {
    var currencies: CurrencyList? { get set }
    func setupTableView()
    func updateCells(_ currencies: CurrencyList)
}

class CurrencyListViewController: UIViewController, CurrencyListViewProtocol {
    
    var currencies: CurrencyList?

    var presenter: CurrencyListPresenterProtocol!
    let configurator: CurrencyListConfiguratorProtocol = CurrencyListConfigurator()
    
    let mainTV: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VC: ViewDidLoad started!")
        
        configurator.configure(with: self)
        presenter.configureView()
        
        print("VC: After presentor methods")
        print("VC: Self currency.count = \(currencies?.data?.count ?? 0)")
    }
    
}

// MARK: - TableView ReloadData

extension CurrencyListViewController {
    func updateCells(_ currencies: CurrencyList) {
        self.currencies = currencies
        mainTV.reloadData()
    }
}

// MARK: - Setup TableView in controller

extension CurrencyListViewController {
    func setupTableView() {
        
        mainTV.delegate = self
        mainTV.dataSource = self
        
        let tableViewLoadingCellNib = UINib(nibName: "LoadingTableViewCell", bundle: nil)
        mainTV.register(tableViewLoadingCellNib, forCellReuseIdentifier: "loadingCell")

        mainTV.register(CurrencyMainCell.self, forCellReuseIdentifier: "CurrencyCell")

        view.addSubview(mainTV)

        NSLayoutConstraint.activate([
            mainTV.topAnchor.constraint(equalTo: self.view.topAnchor),
            mainTV.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mainTV.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            mainTV.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
}

// MARK: -  TableView DataSource

extension CurrencyListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "loadingCell", for: indexPath) as! LoadingTableViewCell
            cell.activityIndicator.startAnimating()
            return cell
        }
        
        let model = CurrencyCellModel(data[indexPath.row])
        let cell = mainTV.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyMainCell
        cell.model = model
        
        cell.backgroundColor = UIColor.white
        
        
        return cell
    }
}
