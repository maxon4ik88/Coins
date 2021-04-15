//
//  CurrencyListCounter.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import Foundation

class CurrencyListCounter {
    
    static let shared = CurrencyListCounter()
    
    var isUpdate = false
    
    private var iteration = 0
    private var oldLimit = 0
    
    private var totalLoaded = 1 {
        didSet  {
            if !isUpdate {
                iteration += 1
            }
        }
    }
    
    var start: Int {
        if isUpdate {
            return 1
        } else {
            return totalLoaded
        }
    }
    
    var limit: Int {
        switch iteration {
        case _ where isUpdate == true:
            return totalLoaded
        case 0:
            totalLoaded += 30
            oldLimit = totalLoaded
            return 30
        case 1:
            totalLoaded += 10
            oldLimit = 31
            return 10
        default:
            totalLoaded += 10
            oldLimit = 10
            return 10
        }
    }
    
    private init() {}
}
