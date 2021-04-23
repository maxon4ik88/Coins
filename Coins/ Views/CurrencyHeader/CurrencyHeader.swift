//
//  CurrencyHeader.swift
//  Coins
//
//  Created by Maxim on 23.04.2021.
//

import UIKit

final class CurrencyHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Private (Properties)
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Currency"
        label.font = .boldSystemFont(ofSize: 16.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price"
        label.font = .boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var changesLabel: UILabel = {
        let label = UILabel()
        label.text = "Change"
        label.font = .boldSystemFont(ofSize: 16.0)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private (Interface)
    private func setupView() {
        addSubviews()
        addLayouts()
    }
    
    private func addSubviews() {
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(changesLabel)
    }
    
    private func addLayouts() {
        nameLabel.anchor(top: topAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: nil,
                         paddingTop: 5.0,
                         paddingLeft: 10.0,
                         paddingBottom: 5.0,
                         paddingRight: 0.0,
                         width: 120.0,
                         height: 0.0,
                         enableInsets: false)
        
        priceLabel.anchor(top: topAnchor,
                          left: nil,
                          bottom: bottomAnchor,
                          right: nil,
                          paddingTop: 5.0,
                          paddingLeft: 0.0,
                          paddingBottom: 5.0,
                          paddingRight: 0.0,
                          width: 90.0,
                          height: 0.0,
                          enableInsets: false)
        priceLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        changesLabel.anchor(top: topAnchor,
                            left: nil,
                            bottom: bottomAnchor,
                            right: rightAnchor,
                            paddingTop: 5.0,
                            paddingLeft: 0.0,
                            paddingBottom: 5.0,
                            paddingRight: 10.0,
                            width: 70.0,
                            height: 0.0,
                            enableInsets: false)
    }
}
