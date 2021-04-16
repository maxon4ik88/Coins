//
//  CustomHeaderView.swift
//  Coins
//
//  Created by Maxon on 08.03.2021.
//

import UIKit

class CustomHeaderView: UIView {
    
    // MARK: - Labels
    
    private let nameLabel = SectionCurrencyLabel()
    private let priceLabel = SectionPriceLabel()
    private let changeLabel = SectionChangesLabel()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(priceLabel)
        addSubview(nameLabel)
        addSubview(changeLabel)
        
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
        
        changeLabel.anchor(top: topAnchor,
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
