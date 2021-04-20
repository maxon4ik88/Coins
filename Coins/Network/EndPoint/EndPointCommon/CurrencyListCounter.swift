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
                startOn = 1
                limitOf = 30
                totalLoads = limit
            case .update:
                startOn = 1
                limitOf = totalLoads
            case .scroll:
                totalLoads += 1
                startOn = totalLoads
                limitOf = 10
                totalLoads += 10
            case .none:
                return
            }
        }
    }
    
    
    var start: Int { startOn }
    var limit: Int { limitOf }
    
    // MARK: - Private (Properties)
    private var totalLoads = 0
    private var startOn = 0
    private var limitOf = 0
    
    // MARK: - Init
    private init() {}
}
