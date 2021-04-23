//
//  ModuleInterface.swift
//  Coins
//
//  Created by Maxim on 22.04.2021.
//

protocol ModuleInterface {
    
    associatedtype Presenter where Presenter: PresenterInterface
    associatedtype Interactor where Interactor: InteractorInterface
    
    func assemble(presenter: Presenter, interactor: Interactor)
}

extension ModuleInterface {
    
    func assemble(presenter: Presenter, interactor: Interactor) {
        presenter.interactor = (interactor as! Self.Presenter.InteractorPresenter)
        
        interactor.presenter = (presenter as! Self.Interactor.PresenterInteractor)
        
    }
}
