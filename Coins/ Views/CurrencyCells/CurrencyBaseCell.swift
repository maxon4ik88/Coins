//
//  CurrencyBaseCell.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

import UIKit

class CurrencyBaseCell: UITableViewCell, ModelRepresentable {
    
    // MARK: - ModelRepresentable
    var model: CellIdentifiable? {
        didSet { updateViews() }
    }
    
    // MARK: - CurrencyBaseCell
    func updateViews() {}
}
