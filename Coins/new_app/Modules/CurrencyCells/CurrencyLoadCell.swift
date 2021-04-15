//
//  CurrencyLoadCell.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

import UIKit

class CurrencyLoadCell: CurrencyBaseCell {
    private var activityIndicator = UIActivityIndicatorView(style: .medium)
    
    override func updateViews() {
        guard let _ = model as? LoadCellModel else { return }
        activityIndicator.startAnimating()
        activityIndicator.frame = self.bounds
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(activityIndicator)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
