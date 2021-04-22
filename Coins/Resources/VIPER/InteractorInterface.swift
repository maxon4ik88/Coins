//
//  InteractorInterface.swift
//  Coins
//
//  Created by Maxim on 22.04.2021.
//

protocol InteractorInterface: InteractorPresenterInterface {
    associatedtype PresenterInteractor
    
    var presenter: PresenterInteractor! { get set }
}
