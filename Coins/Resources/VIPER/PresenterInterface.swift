//
//  PresenterInterface.swift
//  Coins
//
//  Created by Maxim on 22.04.2021.
//

protocol PresenterInterface: PresenterViewInterface & PresenterInteractorInterface {
    associatedtype InteractorPresenter
    
    var interactor: InteractorPresenter! { get set }
}

