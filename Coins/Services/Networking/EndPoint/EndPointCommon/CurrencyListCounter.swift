//
//  CurrencyListCounter.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

class CurrencyListCounter {
    
    // MARK: - Public (Properties)
    static let shared = CurrencyListCounter()
    
    var loadType: LoadTypes {
        didSet {
            switch loadType {
            case .update:
                start = 1
                limit = totalLoads
            case .firstLoad:
                start = 1
                limit = 30
                totalLoads = limit
            case .scrollLoad:
                totalLoads += 1
                start = totalLoads
                limit = 10
                totalLoads += 10
            }
        }
    }
    
    var start = 0
    var limit = 0
    
    // MARK: - Private (Properties)
    private var totalLoads = 0
    
    // MARK: - Init
    private init() {
        loadType = .firstLoad
    }
}

// MARK: - LoadTypes
extension CurrencyListCounter {
    enum LoadTypes {
        case update
        case firstLoad
        case scrollLoad
    }
}
