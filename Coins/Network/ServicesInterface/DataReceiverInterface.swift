//
//  DataReceiverInterface.swift
//  Coins
//
//  Created by Maxim on 20.04.2021.
//

import Foundation

protocol DataReceiverInterface: class {
    func startTask(_ fromService: NetworkService, with data: Any)
}
