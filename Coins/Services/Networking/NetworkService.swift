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
    func dataDidReceived(_ SessionService: SessionService, with CurrencyModel: Data) {
        let parsedData = jsonManager.parse(data: CurrencyModel)
        
        switch self.taskType {
        case .firstLoad:
            self.delegate?.firstLoad(self, with: parsedData)
        case .scrollLoad:
            self.delegate?.scrollLoad(self, with: parsedData)
        case .updateData:
            self.delegate?.refreshLoad(self, with: parsedData)
        }
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
