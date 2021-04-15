//
//  ParseJSON.swift
//  Coins
//
//  Created by Maxim on 15.04.2021.
//

import Foundation

class JSONManager {
    func parse(data: Data) -> CurrencyList? {
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
