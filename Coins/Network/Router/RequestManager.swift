//
//  RequestManager.swift
//  Coins
//
//  Created by Maxim on 19.04.2021.
//

import Foundation

final class RequestManager<EndPoint: RestEndPointType> {
    
    // MARK: - Public (Interface)
    func buildRequest(from endPoint: EndPoint) throws -> URLRequest {
        let urlComponents = buildComponents(from: endPoint)
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        
        request.httpMethod = endPoint.httpMethod.rawValue
        request.allHTTPHeaderFields = endPoint.header
        
        return request
    }
    
    // MARK: - Private (Interface)
    private func buildComponents(from endPoint: EndPoint) -> URLComponents {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = endPoint.scheme
        urlComponents.host = endPoint.host
        urlComponents.path = endPoint.path
        urlComponents.queryItems = endPoint.parameters
        
        return urlComponents
    }
}
