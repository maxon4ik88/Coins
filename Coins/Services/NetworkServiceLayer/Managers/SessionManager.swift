//
//  SessionManager.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

import Foundation

class SessionManager {
    
    // MARK: - Public (Properties)
    weak var delegate: SessionManagerDelegate?
    
    // MARK: - Private (Properties)
    private let request: URLRequest
    private let type: SessionType
    private let JSONManager: JSONManager
    
    // MARK: - Init
    init(request: URLRequest, type: SessionType, JSONManager: JSONManager) {
        self.request = request
        self.type = type
        self.JSONManager = JSONManager
    }
    
    // MARK: - Public (Interface)
    func startTask() {
        URLSession.shared.dataTask(with: request) { (Data, URLResponse, Error) in
            guard let data = Data else { return }
            DispatchQueue.main.async {
                switch self.type {
                case .firstLoad:
                    self.delegate?.firstLoad(self, with: self.JSONManager.parse(data: data))
                case .scrollLoad:
                    self.delegate?.scrollLoad(self, with: self.JSONManager.parse(data: data))
                case .updateData:
                    self.delegate?.refreshLoad(self, with: self.JSONManager.parse(data: data))
                }
            }
        }.resume()
    }
}
