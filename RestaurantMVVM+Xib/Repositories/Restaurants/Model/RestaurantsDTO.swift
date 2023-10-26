//
//  RestaurantsDTO.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 26.10.2023.
//

import Foundation

internal struct RestaurantsDTO: Decodable {
    let FHRSEstablishment: FHRSEstablishment
}

struct FHRSEstablishment: Decodable {
    let header: [String : String]
    let establishmentCollection: [EstablishmentCollection]
    
    enum CodingKeys: String, CodingKey {
        case header = "Header"
        case establishmentCollection = "EstablishmentCollection"
    }
}

struct EstablishmentCollection: Decodable {
    let businessName: String
    let ratingValue: String
    let addressLine1: String
    let fhrsId: String
    
    enum CodingKeys: String, CodingKey {
        case businessName = "BusinessName"
        case ratingValue = "RatingValue"
        case addressLine1 = "AddressLine1"
        case fhrsId = "FHRSID"
    }
}
