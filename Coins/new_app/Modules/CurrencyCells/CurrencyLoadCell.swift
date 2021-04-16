//
//  CurrencyLoadCell.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

import UIKit

class CurrencyLoadCell: CurrencyBaseCell {
    
    // MARK: - Private (Properties)
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(activityIndicator)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CurrencyBaseCell
    override func updateViews() {
        guard model is LoadCellModel else { return }
        activityIndicator.startAnimating()
        activityIndicator.frame = bounds
    }
}
