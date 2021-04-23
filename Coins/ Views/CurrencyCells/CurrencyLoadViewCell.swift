//
//  CurrencyLoadViewCell.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

import UIKit

final class CurrencyLoadViewCell: CurrencyBaseViewCell {
    
    // MARK: - Private (Properties)
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .medium
        
        return activityIndicator
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CurrencyBaseCell
    override func updateViews() {
        guard model is CurrencyLoadCellModel else { return }
        
        activityIndicator.startAnimating()
    }
    
    // MARK: - Private (Interface)
    private func setupView() {
        addSubviews()
        addLayouts()
    }
    
    private func addSubviews() {
        addSubview(activityIndicator)
    }
    
    private func addLayouts() {
        activityIndicator.anchor(top: topAnchor,
                                 left: nil,
                                 bottom: bottomAnchor,
                                 right: nil,
                                 paddingTop: 5.0,
                                 paddingLeft: 0.0,
                                 paddingBottom: 5.0,
                                 paddingRight: 0.0,
                                 width: 80.0,
                                 height: 0.0,
                                 enableInsets: false)
        activityIndicator.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
}
