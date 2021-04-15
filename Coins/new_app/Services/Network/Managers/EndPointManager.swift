//
//  EndPointManager.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

import Foundation

class EndPointManager {
    
    private let endPoint: EndPoint
    private let scheme: String
    private let host: String
    private let path: String
    private let parameters: String
    
    let url: String
    let httpMethod: String
    let header: [String: String]
    
    init(endPoint: EndPoint) {
        self.endPoint = endPoint
        scheme = endPoint.scheme
        host = endPoint.host
        path = endPoint.path
        parameters = endPoint.parameters
        url = scheme + host + path + parameters
        httpMethod = endPoint.httpMethod.rawValue
        header = endPoint.header
    }
}
