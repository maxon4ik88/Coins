//
//  EndPoint.swift
//  Coins
//
//  Created by Maxim on 12.04.2021.
//

import Foundation

enum EndPoint {
    case loadLatestMarketData
    case loadIDMaps
}

extension EndPoint {
    
    // MARK: - Private (Properties)
    private var endPointPath: String {
        switch self {
        case .loadLatestMarketData:
            return "/listings/latest"
        case .loadIDMaps:
            return "/map"
        }
    }
    
    private var commonPath: String {
        "/v1/cryptocurrency"
    }
    
    private var apiKey: String {
        return "b8565320-570b-45eb-80e2-e2979631db68"
    }
    
    private var counter: CurrencyListCounter {
        return CurrencyListCounter.shared
    }
}

// MARK: - RestEndPointType
extension EndPoint: RestEndPointType {
    
    var scheme: String {
        "https"
    }
    
    var host: String {
        "pro-api.coinmarketcap.com"
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .loadLatestMarketData,
             .loadIDMaps:
            return .get
        }
    }
    
    var path: String {
        return commonPath + endPointPath
    }
    
    var header: [String : String] {
        return ["X-CMC_PRO_API_KEY": apiKey]
    }
    
    var start: Int {
        return counter.start
    }
    
    var limit: Int {
        return counter.limit
    }
    
    var parameters: String {
        return "?limit=\(limit)&start=\(start)"
    }
}
