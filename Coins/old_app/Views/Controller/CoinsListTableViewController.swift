//
//  CoinsListTableViewController.swift
//  Coins
//
//  Created by Maxon on 07.03.2021.
//

import UIKit

class CoinsListTableViewController: UITableViewController {
    
//    let network = NetworkManager()
    
    var currencyList: CurrencyList?
    
    var isFetching = false
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        network.delegate = self
//        network.fetchCurrencies(with: .firstLoad)
        
        setupRefreshControl()
        cellInitialize()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // MARK: - Header options
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CustomHeaderView(frame: CGRect(x: 0, y: 0,
                                                        width: tableView.frame.size.width,
                                                        height: tableView.frame.size.height))
        headerView.backgroundColor = .systemGray6
        
        return section == 0 ? headerView : nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 30 : CGFloat.leastNonzeroMagnitude
    }
    
    // MARK: - Rows options
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            guard let currencyDataCount = currencyList?.data?.count, currencyDataCount > 0 else { return 0 }
            return currencyDataCount
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let currencyList = currencyList, let data = currencyList.data, indexPath.section == 0 else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "loadingCell", for: indexPath) as! LoadingTableViewCell
            cell.activityIndicator.startAnimating()
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        cell.unit = data[indexPath.row]
        
        return cell
    }
    
    // MARK: - Scrolling
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if (scrollView.contentOffset.y + scrollView.frame.size.height > scrollView.contentSize.height) && !isFetching {
            isFetching.toggle()
//            network.fetchCurrencies(with: .scrollLoad)
        }
    }
    
    // MARK: - RefreshControl
    
    private func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(updateData), for: .valueChanged)
        tableView.addSubview(refreshControl ?? UIRefreshControl())
    }
    
    @objc private func updateData() {
//        network.fetchCurrencies(with: .updateData)
    }
    
    // MARK: - TableView cell init
    
    private func cellInitialize() {
        let tableViewLoadingCellNib = UINib(nibName: "LoadingTableViewCell", bundle: nil)
        tableView.register(tableViewLoadingCellNib, forCellReuseIdentifier: "loadingCell")
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        tableView.rowHeight = 44
    }
}
