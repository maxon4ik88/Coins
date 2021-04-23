//
//  SceneDelegate.swift
//  Coins
//
//  Created by Maxon on 07.03.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Public (Properties)
    var window: UIWindow?
    
    // MARK: - Public (Interfaces)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let currencyListModule = CurrencyListModule()
        let currencyListViewController = currencyListModule.build()
        let newNavigationController = UINavigationController(rootViewController: currencyListViewController)
        
        window?.makeKeyAndVisible()
        window?.rootViewController = newNavigationController
    }
}
