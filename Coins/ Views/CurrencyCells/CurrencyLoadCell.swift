//
//  CurrencyLoadCell.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

import UIKit

class CurrencyLoadCell: CurrencyBaseCell {
    
    // MARK: - Private (Properties)
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .medium
        
        return activityIndicator
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        addLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CurrencyBaseCell
    override func updateViews() {
        guard model is LoadCellModel else { return }
        
        activityIndicator.startAnimating()
    }
    
    // MARK: - Private (Interface)
    private func addSubviews() {
        addSubview(activityIndicator)
    }
    
    private func addLayouts() {
        activityIndicator.anchor(top: topAnchor,
                                 left: nil,
                                 bottom: bottomAnchor,
                                 right: nil,
                                 paddingTop: 5,
                                 paddingLeft: 0,
                                 paddingBottom: 5,
                                 paddingRight: 0,
                                 width: 80,
                                 height: 0,
                                 enableInsets: false)
        activityIndicator.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
}
