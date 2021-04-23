//
//  ViewInterface.swift
//  Coins
//
//  Created by Maxim on 22.04.2021.
//

protocol ViewInterface {
    associatedtype PresenterView
    
    var presenter: PresenterView! { get set }
}
