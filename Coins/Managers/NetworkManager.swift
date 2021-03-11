//
//  NetworkManager.swift
//  Coins
//
//  Created by Maxon on 08.03.2021.
//

import Foundation

protocol NetworkManagerDelegate: class {
    func firstLoad(_: NetworkManager, data: CurrencyList?)
    func scrollLoad(_: NetworkManager, data: CurrencyList?)
    func refreshLoad(_: NetworkManager, data: CurrencyList?)
}

class NetworkManager {
    
    weak var delegate: NetworkManagerDelegate?
    
    private var startFrom = 1
    private var count = 30
    
    private var totalLoadedCurrencies = 0
    
    func fetchCurrencies(with behavior: DownloadBehavior) {
        
        var baseURL = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"
        
        switch behavior {
        
        case .firstLoad:
            baseURL += "?limit=\(count)&start=\(startFrom)"
            startFrom += count
            totalLoadedCurrencies = startFrom
            count = 10
            
        case .scrollLoad:
            baseURL += "?limit=\(count)&start=\(startFrom)"
            startFrom += count
            count = 10
            totalLoadedCurrencies += 10
            
        case .updateData:
            baseURL += "?limit=\(totalLoadedCurrencies)&start=\(1)"
        }
        
        guard let url = URL(string: baseURL) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["X-CMC_PRO_API_KEY":"b8565320-570b-45eb-80e2-e2979631db68"]
        
        URLSession.shared.dataTask(with: request) { (Data, URLResponse, Error) in
            
            guard let data = Data else { return }
            
            DispatchQueue.main.async {
                
                switch behavior {
                
                case .firstLoad:
                    self.delegate?.firstLoad(self, data: self.parseJSON(data: data))
                    
                case .scrollLoad:
                    self.delegate?.scrollLoad(self, data: self.parseJSON(data: data))
                    
                case .updateData:
                    self.delegate?.refreshLoad(self, data: self.parseJSON(data: data))
                }
                
            }
            
        }.resume()
    }
    
    private func parseJSON(data: Data) -> CurrencyList? {
        let decoder = JSONDecoder()
        
        do {
            let parsedModel = try decoder.decode(CurrencyList.self, from: data)
            return parsedModel
        } catch let error as NSError {
            print("PARSE_JSON_ERROR: \(error.localizedDescription)")
        }
        return nil
    }
    
}

extension NetworkManager {
    enum DownloadBehavior {
        case firstLoad
        case scrollLoad
        case updateData
    }
}
