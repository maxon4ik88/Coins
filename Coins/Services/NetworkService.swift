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
    private let taskType: SessionService.SessionType
    private var sessionService: SessionService?
    private let jsonManager = JSONManager()
    
    private var data: Data? {
        didSet {
            guard data != nil else { return }
            dataDidReceive()
        }
    }
    
    deinit {
        print("NETWORK_SERVICE_IS - DEAD!")
    }
    
    // MARK: -  Init
    init(with task: SessionService.SessionType) {
        endPoint = .loadLatestMarketData
        taskType = task
//        sessionService = SessionService(endPoint: endPoint)
//        sessionService.delegate = self
//        print("NetworkService: IN_INIT - \(sessionService.delegate)")
    }
    
    init(data: EndPoint, with task: SessionService.SessionType) {
        endPoint = data
        taskType = task
//        sessionService = SessionService(endPoint: endPoint)
//        sessionService.delegate = self
    }
    
    // MARK: Public (Interface)
    func startTask() {
//        sessionService.delegate = self
//        sessionService.fetchData()
//        print(delegate)
        
        let session = SessionService(endPoint: .loadLatestMarketData, delegate: self)
//        session.delegate = self
        session.fetchData()
    }
    
    private func dataDidReceive() {
        print("NetworkService: DATA_DID_RECEIVE!")
        guard let data = data else { return }
        
        let parsedData = jsonManager.parse(data: data)
        
//        DispatchQueue.main.async {
            switch self.taskType {
            case .firstLoad:
                self.delegate?.firstLoad(self, with: parsedData)
            case .scrollLoad:
                self.delegate?.scrollLoad(self, with: parsedData)
            case .updateData:
                self.delegate?.refreshLoad(self, with: parsedData)
            }
//        }
    }
}

extension NetworkService: SessionServiceDelegate {
    func dataDidReceived2(_ SessionService: SessionService, with CurrencyModel: Data) {
        let parsedData = jsonManager.parse(data: CurrencyModel)
        print("NetworkService: ParsedData - ok!")
        switch self.taskType {
        case .firstLoad:
            print("NetworkService: dataDidReceived2")
            self.delegate?.firstLoad(self, with: parsedData)
        case .scrollLoad:
            self.delegate?.scrollLoad(self, with: parsedData)
        case .updateData:
            self.delegate?.refreshLoad(self, with: parsedData)
        }
    }
}
