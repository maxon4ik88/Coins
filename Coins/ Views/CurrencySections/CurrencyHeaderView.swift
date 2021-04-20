//
//  CurrencyHeaderView.swift
//  Coins
//
//  Created by Maxon on 08.03.2021.
//

import UIKit

final class CurrencyHeaderView: UIView {
    
    // MARK: - Private (Properties)
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Currency"
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price"
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    private lazy var changesLabel: UILabel = {
        let label = UILabel()
        label.text = "Change"
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private (Interface)
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
                                 paddingTop: 5,
                                 paddingLeft: 10,
                                 paddingBottom: 5,
                                 paddingRight: 0,
                                 width: 120,
                                 height: 0,
                                 enableInsets: false)
        
        priceLabel.anchor(top: topAnchor,
                                  left: nil,
                                  bottom: bottomAnchor,
                                  right: nil,
                                  paddingTop: 5,
                                  paddingLeft: 0,
                                  paddingBottom: 5,
                                  paddingRight: 0,
                                  width: 90,
                                  height: 0,
                                  enableInsets: false)
        priceLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        changesLabel.anchor(top: topAnchor,
                                    left: nil,
                                    bottom: bottomAnchor,
                                    right: rightAnchor,
                                    paddingTop: 5,
                                    paddingLeft: 0,
                                    paddingBottom: 5,
                                    paddingRight: 10,
                                    width: 70,
                                    height: 0,
                                    enableInsets: false)
    }
}
