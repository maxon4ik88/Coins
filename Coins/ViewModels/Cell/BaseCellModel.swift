//
//  BaseCellModel.swift
//  Coins
//
//  Created by Максим Шванов on 13.04.2021.
//

import Foundation


class BaseCellModel: CellIdentifiable {
    
    // MARK: - Private (Properties)
    private let automaticHeight: Float = -1.0
    
    // MARK: - CellIdentifiable
    var cellIdentifier: String { "" }
    var cellHeight: Float { automaticHeight }
}
