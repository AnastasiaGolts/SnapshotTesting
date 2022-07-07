//
//  Model.swift
//  Snapshots
//
//  Created by Peter K on 07.07.2022.
//

import Foundation

struct Currency: Codable {
    var success: Bool
    var base: String
    var date: String
    var rates = [String: Double]()
}
