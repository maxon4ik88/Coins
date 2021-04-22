//
//  CurrencyService.swift
//  Coins
//
//  Created by Maxim on 19.04.2021.
//

final class CurrencyService: NetworkService {
    
    // MARK: - Public (Properties)
    weak var delegate: CurrencyServiceDelegate!
    
    // MARK: - Private (Properties)
    private let counter = CurrencyListCounter.shared
    
    // MARK: - Public (Interface)
    func fetchCurrencies(for taskType: TaskType) {
        counter.taskType = taskType
        
        sendRequest(for: .loadLatestMarketData) { [weak self] data in
            guard let data = data else { return }
            guard let parsedData = try? self?.localDecoder.decode(CurrencyList.self, from: data) else { return }
            guard let currencies = parsedData.data else { return }
            
            self?.delegate?.startTask(fromService: self!, with: currencies, after: taskType)
        }
    }
}

// MARK: - CurrencyService.TaskType
extension CurrencyService {
    enum TaskType {
        case appear
        case scroll
        case update
    }
}
