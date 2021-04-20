//
//  NetworkService.swift
//  Coins
//
//  Created by Maxim on 19.04.2021.
//

import Foundation

class NetworkService {
    
    // MARK: - Public (Properties)
    var localDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy  = .convertFromSnakeCase
        return decoder
    }
    
    // MARK: - Private (Properties)
    private let router = Router<EndPoint>()
    
    // MARK: - Public (Interface)
    final func sendRequest(for endPoint: EndPoint, completion: @escaping (Data?) -> Void) {
        router.request(for: endPoint) { data, _, _ in
            completion(data)
        }
    }
}
