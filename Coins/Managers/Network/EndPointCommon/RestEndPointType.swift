//
//  RestEndPointType.swift
//  Coins
//
//  Created by Maxim on 13.04.2021.
//

import Foundation

protocol RestEndPointType {
    var scheme: String { get }
    var host: String { get }
    var httpMethod: HTTPMethod { get }
    var path: String { get }
    var header: [String: String]  { get }
    var start: Int { get }
    var limit: Int { get }
    var parameters: String { get }
}
