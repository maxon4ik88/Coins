//
//  CurrencyListCounter.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import Foundation

class CurrencyListCounter {
    
    static let shared = CurrencyListCounter()
    
    private var iteration = 1
    
    private var count = 1 {
        didSet  {
            iteration += 1
        }
    }
    
    var start: Int {
        return count
    }
    
    var limit: Int {
        if iteration == 1 {
            count += 30
            return 30
        } else {
            count += 10
            return 10
        }
    }
    
    private init() {}
}
