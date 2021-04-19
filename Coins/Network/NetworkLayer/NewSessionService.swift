//
//  SessionService.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

import Foundation

class NewSessionService<EndPoint: RestEndPointType> {
    
    // MARK: - Private (Properties)
    private let requestManager = RequestManager<EndPoint>()
    
    // MARK: - Public (Interface)
    func startSession(for endPoint: EndPoint) -> URLSessionDataTask {
        let request = try! requestManager.buildRequest(from: endPoint)
        
        print("[\(Date())] \n Request to EndPoint: \(request)")
        
//        URLSession.shared.dataTask(with: request) { (Data, URLResponse, Error) in
//            guard let data = Data else { return }
//
//
//        }.resume()
        
        return URLSession.shared
            .dataTask(with: request)
    }
}
