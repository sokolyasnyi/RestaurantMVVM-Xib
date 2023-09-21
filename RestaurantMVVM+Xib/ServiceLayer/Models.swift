//
//  Models.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 21.09.2023.
//

import Foundation

struct Root: Codable {
    let results: Results
    let status: Int
    let msg: String?
}

// MARK: - Result
struct Results: Codable {
    let data: [Rest]
}

struct Rest: Codable {
    let locationId: String
    let name: String
    let rating: String
    let priceLevel: String

    enum CodingKeys: String, CodingKey {
        case locationId = "location_id"
        case name = "name"
        case rating = "rating"
        case priceLevel = "price_level"
        
    }
}
