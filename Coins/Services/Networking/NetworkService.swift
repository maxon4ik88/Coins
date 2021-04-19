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
    private let jsonManager = JSONManager()
    private var taskType: NetworkService.LoadType?
    private var session: SessionService?
    
    // MARK: Public (Interface)
    func fetchData(of dataType: EndPoint, with loadType: LoadType) {
        taskType = loadType
        
        session = SessionService(endPoint: dataType)
        session?.delegate = self
        session?.sendRequest()
    }
}

// MARK: - SessionServiceDelegate
extension NetworkService: SessionServiceDelegate {
    func receivedFromSession(_ SessionService: SessionService, with CurrencyModel: Data) {
        guard let taskType = taskType else { return }
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
