//
//  Restaurant.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 19.09.2023.
//

import Foundation

enum RatingsStars: Int {
    case one
    case two
    case three
    case four
    case five
    
    var rawValue: Int {
        switch self {
        case .one: 1
        case .two: 2
        case .three: 3
        case .four: 4
        case .five: 5
        }
    }
    
}

struct Restaurant {
    let id: String?
    let name: String?
    var ratingCount: RatingsStars? = .one
    var address: String?
    var isRecommended: Bool {
        if self.ratingCount == .four || self.ratingCount == .five {
            return true
        } else {
            return false
        }
    }
    
    init(id: String, name: String, ratingCount: RatingsStars, address: String, isRecommended: Bool) {
        self.id = id
        self.name = name
        self.ratingCount = ratingCount
        self.address = address
    }
    
    init(data: Dictionary<String, Any>) {
        self.id = String("\(data["FHRSID"] as? Int)")
        self.name = data["BusinessName"] as? String
        self.address = data["AddressLine1"] as? String
        
        if let ratingCount = data["RatingValue"] as? String {
            switch ratingCount {
            case "1": self.ratingCount = .one
            case "2": self.ratingCount = .two
            case "3": self.ratingCount = .three
            case "4": self.ratingCount = .four
            case "5": self.ratingCount = .five
            default: print("rating not found")
            }
        }
    }
    
    init(id: String, name: String, ratingCount: String, address: String) {
        self.id = id
        self.name = name
        self.address = address
        
        switch ratingCount {
        case "1": self.ratingCount = .one
        case "2": self.ratingCount = .two
        case "3": self.ratingCount = .three
        case "4": self.ratingCount = .four
        case "5": self.ratingCount = .five
        default: print("rating not found")
        }
    }
    
    
}
