//
//  CurrencyBaseViewCell.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

import UIKit

class CurrencyBaseViewCell: UITableViewCell, ModelRepresentable {
    
    // MARK: - ModelRepresentable
    var cellModel: CellIdentifiable? {
        didSet { updateViews() }
    }
    
    // MARK: - CurrencyBaseCell
    func updateViews() {}
}
