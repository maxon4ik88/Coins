//
//  URLRequest+customRequest.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

import Foundation

extension URLRequest {
    static func customRequest(endPointManager: EndPointManager) -> URLRequest {
        guard let url = URL(string: endPointManager.url) else {
            let url = URL(string: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?limit=2&start=1")!
            return URLRequest(url: url)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endPointManager.httpMethod
        request.allHTTPHeaderFields = endPointManager.header
        return request
    }
}
