//
//  CurrencyListPresenterProtocol.swift
//  Coins
//
//  Created by Maxim on 14.04.2021.
//

protocol CurrencyListPresenterProtocol: class {
    func configureView()
    func refreshViewCells()
    func didScrollViewCells()
    func didReceiveFromInteractor(parsedData: [CurrencyData], with type: CurrencyService.TaskType)
}
