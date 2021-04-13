//
//  CurrencyListInteractor.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import Foundation

protocol CurrencyListInteractorProtocol: class {
    var endPoint: EndPoint { get }
    func openUrl(with urlString: String)
}

class CurrencyListInteractor: CurrencyListInteractorProtocol {
    
    weak var presenter: CurrencyListPresenterProtocol!
    
    required init(presenter: CurrencyListPresenterProtocol) {
        self.presenter = presenter
    }
    
    var endPoint: EndPoint {
        return EndPoint.loadLatestMarketData
    }
    
    func openUrl(with urlString: String) {
        
    }
}
