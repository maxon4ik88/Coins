//
//  CellIdentifiable.swift
//  Coins
//
//  Created by Maxim on 16.04.2021.
//

import Foundation

protocol CellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: Float { get }
}
