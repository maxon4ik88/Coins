//
//  NetworkService.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

import Foundation

class NetworkService {
    
    // MARK: - Public (Properties)
    weak var delegate: SessionManagerDelegate? {
        didSet { sessionManager.delegate = delegate }
    }
    
    // MARK: - Private (Properties)
    private let loadType: SessionManager.SessionType
    private let endPoint: EndPoint
    private let endPointManager: EndPointManager
    private let requestManager: RequestManager
    private let request: URLRequest
    private let jsonManager: JSONManager
    private let sessionManager: SessionManager
    
    // MARK: -  Init
    init(with task: SessionManager.SessionType) {
        loadType = task
        endPoint = .loadLatestMarketData
        endPointManager = EndPointManager(endPoint: endPoint)
        requestManager = RequestManager(endPointManager: endPointManager)
        request = requestManager.request
        jsonManager = JSONManager()
        sessionManager = SessionManager(request: request, type: task, JSONManager: jsonManager)
    }
    
    init(data: EndPoint, with task: SessionManager.SessionType) {
        loadType = task
        endPoint = data
        endPointManager = EndPointManager(endPoint: endPoint)
        requestManager = RequestManager(endPointManager: endPointManager)
        request = requestManager.request
        jsonManager = JSONManager()
        sessionManager = SessionManager(request: request, type: task, JSONManager: jsonManager)
    }
    
    // MARK: Public (Interface)
    func startTask() {
        sessionManager.startTask()
    }
}
