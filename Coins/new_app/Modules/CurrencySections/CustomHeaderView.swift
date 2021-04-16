//
//  CustomHeaderView.swift
//  Coins
//
//  Created by Maxon on 08.03.2021.
//

import UIKit

class CustomHeaderView: UIView {
    
    // MARK: - Private (Properties)
    private let currencyNameLabel = SectionCurrencyLabel()
    private let currencyPriceLabel = SectionPriceLabel()
    private let currencyChangesLabel = SectionChangesLabel()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(currencyPriceLabel)
        addSubview(currencyNameLabel)
        addSubview(currencyChangesLabel)
        currencyNameLabel.anchor(top: topAnchor,
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
        currencyPriceLabel.anchor(top: topAnchor,
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
        currencyPriceLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        currencyChangesLabel.anchor(top: topAnchor,
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
