//
//  SessionService.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

import Foundation

class SessionService {
    
    // MARK: - Private (Properties)
    private let endPoint: EndPoint
    private let semaphore = DispatchSemaphore(value: 0)
    private var components = URLComponents()
    
    weak var delegate: SessionServiceDelegate?
    
    private var data: Data?
    
    // MARK: - Init
    init(endPoint: EndPoint, delegate: SessionServiceDelegate) {
        self.endPoint = endPoint
        
        components.scheme = endPoint.scheme
        components.host = endPoint.host
        components.path = endPoint.path
        components.queryItems = endPoint.testParameters
        
        self.delegate = delegate
        print("SessionService_IN_INIT - \(delegate)")
    }
    
    // MARK: - Public (Interface)
    func fetchData() {
        print("SessionService_IN_FETCH_DATA - \(delegate)")
        guard let url = components.url else { return }
        print("SessionService_AFTER_URL - \(delegate)")
        
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.httpMethod.rawValue
        request.allHTTPHeaderFields = endPoint.header
        print("SessionService_AFTER_REQUEST - \(delegate)")
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { [weak delegate] Data, URLResponse, Error in
            print("SessionService_IN_CUSTOM_SESSION - \(delegate)")
        }
        dataTask.resume()
        
        URLSession.shared.dataTask(with: request) { (Data, URLResponse, Error) in
            print("SessionService_IN_SESSION_BEFORE_GUARD - \(self.delegate)")
            guard let data = Data else {
//                self.semaphore.signal()
                
                return
            }

            print("SessionService: DATA_DID_RECEIVED!")
            print("SessionService: \(self.delegate)")
            self.delegate?.dataDidReceived2(self, with: data)
//            self.semaphore.signal()
        }.resume()
        
//        semaphore.wait()
        print("SessionService_END: \(delegate)")
    }
}

protocol SessionServiceDelegate: class {
    func dataDidReceived2(_ SessionService: SessionService, with CurrencyModel: Data)
}
