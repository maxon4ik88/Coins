//
//  CustomLabel.swift
//  Coins
//
//  Created by Maxim on 16.04.2021.
//

import UIKit

class CellNameLabel: UILabel {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = .boldSystemFont(ofSize: CGFloat(14))
        textAlignment =  .left
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
