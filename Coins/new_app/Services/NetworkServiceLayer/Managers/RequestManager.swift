//
//  RequestManager.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

import Foundation

class RequestManager {
    
    private let endPointManager: EndPointManager
    
    var request: URLRequest {
        return URLRequest.customRequest(endPointManager: endPointManager)
    }
    
    init(endPointManager: EndPointManager) {
        self.endPointManager = endPointManager
    }
}
