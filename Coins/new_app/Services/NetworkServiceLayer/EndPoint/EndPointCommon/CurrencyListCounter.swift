//
//  CurrencyListCounter.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import Foundation

class CurrencyListCounter {
    
    static let shared = CurrencyListCounter()
    
    private var totalLoads = 30
    
    var loadType: LoadTypes {
        didSet {
            switch loadType {
            case .update:
                start = 1
                limit = totalLoads
            case .firstLoad:
                totalLoads = 30
            case .scrollLoad:
                if totalLoads == 30 {
                    start = totalLoads + 1
                }  else {
                    start = totalLoads
                }
                limit = 10
                totalLoads += 10
            }
        }
    }
    
    var start: Int = 1
    var limit = 30
    
    private init() {
        loadType = .firstLoad
    }
}

extension CurrencyListCounter {
    enum LoadTypes {
        case update
        case firstLoad
        case scrollLoad
    }
}
