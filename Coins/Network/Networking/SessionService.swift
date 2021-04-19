//
//  SessionService.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

//import Foundation
//
//class SessionService {
//    
//    // MARK: - Public (Properties)
//    weak var delegate: SessionServiceDelegate?
//    
//    // MARK: - Private (Properties)
//    private let endPoint: EndPoint
//    private var components = URLComponents()
//    
//    // MARK: - Init
//    init(endPoint: EndPoint) {
//        self.endPoint = endPoint
//        
//        components.scheme = endPoint.scheme
//        components.host = endPoint.host
//        components.path = endPoint.path
//        components.queryItems = endPoint.parameters
//    }
//    
//    // MARK: - Public (Interface)
//    func sendRequest() {
//        guard let url = components.url else { return }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = endPoint.httpMethod.rawValue
//        request.allHTTPHeaderFields = endPoint.header
//        
//        URLSession.shared.dataTask(with: request) { (Data, URLResponse, Error) in
//            guard let data = Data else { return }
//            
//            self.delegate?.receivedFromSession(self, with: data)
//        }.resume()
//    }
//}
