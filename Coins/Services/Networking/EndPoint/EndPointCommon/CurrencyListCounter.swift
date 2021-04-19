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
                totalLoads = 30
            case .scrollLoad:
                if totalLoads == 30 {
                    totalLoads += 1
                    start = totalLoads
                } else {
                    start = totalLoads
                }
                limit = 10
                totalLoads += 10
            }
        }
    }
    var start: Int = 1
    var limit = 30
    
    // MARK: - Private (Properties)
    private var totalLoads = 30
    
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
