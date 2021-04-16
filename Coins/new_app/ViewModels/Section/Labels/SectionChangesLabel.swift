//
//  SectionChangesLabel.swift
//  Coins
//
//  Created by Maxim on 16.04.2021.
//

import UIKit

class SectionChangesLabel: UILabel {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        text = "Change"
        font = .boldSystemFont(ofSize: CGFloat(16))
        textAlignment =  .right
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
