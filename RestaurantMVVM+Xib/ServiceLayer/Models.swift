//
//  Models.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 21.09.2023.
//

import Foundation

struct Root: Codable {
    let FHRSEstablishment: FHRSEstablishment
}

struct FHRSEstablishment: Codable {
    let header: [String : String]
    let establishmentCollection: [EstablishmentCollection]
    
    enum CodingKeys: String, CodingKey {
        case header = "Header"
        case establishmentCollection = "EstablishmentCollection"
    }
}

struct EstablishmentCollection: Codable {
    let businessName: String
    let ratingValue: String
    
    enum CodingKeys: String, CodingKey {
        case businessName = "BusinessName"
        case ratingValue = "RatingValue"

    }
}

// MARK: - Result
//struct Results: Codable {
//    let data: [Rest]
//}
//
//struct Rest: Codable {
//    let locationId: String
//    let name: String
//    let rating: String
//    let priceLevel: String
//
//    enum CodingKeys: String, CodingKey {
//        case locationId = "location_id"
//        case name = "name"
//        case rating = "rating"
//        case priceLevel = "price_level"
//        
//    }
//}
