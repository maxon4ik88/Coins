//
//  CurrencyService.swift
//  Coins
//
//  Created by Maxim on 19.04.2021.
//

import Foundation

final class CurrencyService: NetworkService {
    
    // MARK: Public (Properties)
    weak var delegate: CurrencyServiceDelegate?
    
    // MARK: Private (Properties)
    private let counter = CurrencyListCounter.shared
    
    // MARK: Public (Interface)
    func beginRequest(with task: TaskType) {
        counter.taskType = task
        
        sendRequest(for: .loadLatestMarketData) { data in
            guard let data = data else { return }
            guard let parsedData = try? self.localDecoder.decode(CurrencyList.self, from: data) else { return }
            guard let currencyArray = parsedData.data else { return }
            
            self.delegate?.requestCompleted(self, with: currencyArray, of: task)
        }
    }
}

// MARK: CurrencyService.TaskType
extension CurrencyService {
    enum TaskType {
        case load
        case scroll
        case update
    }
}
