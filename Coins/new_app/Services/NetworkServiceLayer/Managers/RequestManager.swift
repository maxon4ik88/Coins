//
//  RequestManager.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

import Foundation

class RequestManager {
    
    // MARK: - Public (Properties)
    var request: URLRequest { .customRequest(endPointManager: endPointManager) }
    
    // MARK: - Private (Properties)
    private let endPointManager: EndPointManager
    
    // MARK: - Init
    init(endPointManager: EndPointManager) {
        self.endPointManager = endPointManager
    }
}
