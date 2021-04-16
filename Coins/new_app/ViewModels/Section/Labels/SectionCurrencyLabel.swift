//
//  SectionCurrencyLabel.swift
//  Coins
//
//  Created by Maxim on 16.04.2021.
//

import UIKit

class SectionCurrencyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        text = "Currency"
        font = .boldSystemFont(ofSize: CGFloat(16))
        textAlignment =  .left
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


