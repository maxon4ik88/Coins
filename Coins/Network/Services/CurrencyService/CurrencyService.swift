//
//  CurrencyService.swift
//  Coins
//
//  Created by Maxim on 19.04.2021.
//

final class CurrencyService: NetworkService {
    
    // MARK: - Public (Properties)
    weak var receiver: DataReceiverInterface?
    
    // MARK: - Private (Properties)
    private let counter = CurrencyListCounter.shared
    
    // MARK: - Public (Interface)
    func beginRequest(with task: TaskType) {
        counter.taskType = task
        
        sendRequest(for: .loadLatestMarketData) { data in
            guard let data = data else { return }
            guard let parsedData = try? self.localDecoder.decode(CurrencyList.self, from: data) else { return }
            guard let currencyArray = parsedData.data else { return }
            
            self.receiver?.startTask(self, with: currencyArray)
        }
    }
}

// MARK: - CurrencyService.TaskType
extension CurrencyService {
    enum TaskType {
        case load
        case scroll
        case update
    }
}
