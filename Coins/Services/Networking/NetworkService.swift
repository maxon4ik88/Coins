//
//  NetworkService.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

import Foundation

class NetworkService {
    
    // MARK: - Public (Properties)
    weak var delegate: NetworkServiceDelegate?
    
    // MARK: - Private (Properties)
    private let endPoint: EndPoint
    private let taskType: NetworkService.LoadType
    private var session: SessionService
    private var jsonManager: JSONManager
    
    // MARK: -  Init
    init(with task: NetworkService.LoadType) {
        endPoint = .loadLatestMarketData
        taskType = task
        session = SessionService(endPoint: endPoint)
        jsonManager = JSONManager()
    }
    
    init(data: EndPoint, with task: NetworkService.LoadType) {
        endPoint = data
        taskType = task
        session = SessionService(endPoint: data)
        jsonManager = JSONManager()
    }
    
    // MARK: Public (Interface)
    func startTask() {
        session.delegate = self
        session.fetchData()
    }
}

// MARK: - SessionServiceDelegate
extension NetworkService: SessionServiceDelegate {
    func receivedFromSession(_ SessionService: SessionService, with CurrencyModel: Data) {
        let parsedData = jsonManager.parse(data: CurrencyModel)
        
        delegate?.sentToInteractor(self, parsedData: parsedData, with: taskType)
    }
}

// MARK: NetworkService.LoadType
extension NetworkService {
    enum LoadType {
        case firstLoad
        case scrollLoad
        case updateData
    }
}
