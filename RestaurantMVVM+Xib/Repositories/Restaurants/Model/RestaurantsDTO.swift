//
//  RestaurantsDTO.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 26.10.2023.
//

import Foundation

internal struct RestaurantsDTO: Decodable {
    let FHRSEstablishment: FHRSEstablishmentDTO
}

struct HeaderDTO: Decodable {
    let extractDate: String
    let itemCount: Int
    let returnCode: String
    
    enum CodingKeys: String, CodingKey {
        case extractDate = "ExtractDate"
        case itemCount = "ItemCount"
        case returnCode = "ReturnCode"
    }
}

struct FHRSEstablishmentDTO: Decodable {
    let header: HeaderDTO
    let establishmentCollection: [RestaurantDTO]
    
    enum CodingKeys: String, CodingKey {
        case header = "Header"
        case establishmentCollection = "EstablishmentCollection"
    }
}

struct RestaurantDTO: Decodable {
    let businessName: String
    let ratingValue: String
    let businessType: String
    var addressLine1: String { return _addressLine1 ?? "no name" }
    var fhrsId: Int { return _fhrsId ?? 0 }
    
    private var _addressLine1: String?
    private var _fhrsId: Int?
    
    enum CodingKeys: String, CodingKey {
        case businessName = "BusinessName"
        case ratingValue = "RatingValue"
        case businessType = "BusinessType"
        case _addressLine1 = "AddressLine1"
        case _fhrsId = "FHRSID"
    }
}
