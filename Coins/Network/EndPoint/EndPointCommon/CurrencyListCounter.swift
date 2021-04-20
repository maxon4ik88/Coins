//
//  CurrencyListCounter.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

class CurrencyListCounter {
    
    // MARK: - Public (Properties)
    static let shared = CurrencyListCounter()
    
    var taskType: CurrencyService.TaskType? {
        didSet {
            switch taskType {
            case .load:
                start = 1
                limit = 30
                totalLoads = limit
            case .update:
                start = 1
                limit = totalLoads
            case .scroll:
                totalLoads += 1
                start = totalLoads
                limit = 10
                totalLoads += 10
            case .none:
                return
            }
        }
    }
    
    var start = 0
    var limit = 0
    
    // MARK: - Private (Properties)
    private var totalLoads = 0
}
