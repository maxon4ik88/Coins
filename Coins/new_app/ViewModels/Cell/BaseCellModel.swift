//
//  BaseCellModel.swift
//  Coins
//
//  Created by Максим Шванов on 13.04.2021.
//

import Foundation

protocol CellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: Float { get }
}

protocol ModelRepresentable {
    var model: CellIdentifiable { get set }
}

protocol SectionRowsRepresentable {
    var rows: [CellIdentifiable] { get set }
}

class BaseCellModel: CellIdentifiable {
    
    let automaticHeight: Float = -1.0
    
    var cellIdentifier: String {
        return ""
    }
    
    var cellHeight: Float {
        return automaticHeight
    }
}
