//
//  Router.swift
//  Coins
//
//  Created by Maxim on 19.04.2021.
//

import Foundation

final class Router<EndPoint: RestEndPointType> {
    
    // MARK: Private (Properties)
    private let requestManager = RequestManager<EndPoint>()
    private var task: URLSessionTask?
    
    // MARK: Public (Interface)
    func request(for endPoint: EndPoint, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let session = URLSession.shared
        let request = try! requestManager.buildRequest(from: endPoint)
        
        task = session.dataTask(with: request, completionHandler: { data, response, error in
            completion(data, response, error)
        })
        task?.resume()
    }
}
