//
//  Restaurant.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 19.09.2023.
//

import Foundation

enum RatingsStars {
    case one
    case two
    case three
    case four
    case five
}

struct Restaurant {
    let id: String?
    let name: String?
    var ratingCount: RatingsStars? = .one
    var priceLevel: String?
    var isRecommended: Bool {
        if self.ratingCount == .four || self.ratingCount == .five {
            return true
        } else {
            return false
        }
    }
    
    init(id: String, name: String, ratingCount: RatingsStars, priceLevel: String, isRecommended: Bool) {
        self.id = id
        self.name = name
        self.ratingCount = ratingCount
        self.priceLevel = priceLevel
    }
    
    init(data: Dictionary<String, Any>) {
        self.id = data["id"] as? String
        self.name = data["name"] as? String
        self.priceLevel = data["priceLevel"] as? String
        
        if let ratingCount = data["ratingCount"] as? String {
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
    
    init(data: EstablishmentCollection) {
        self.id = "1"
        self.name = data.businessName
        self.priceLevel = "$$-$$$"
        
        
        let ratingCount = data.ratingValue
        
        switch ratingCount {
        case "1": self.ratingCount = .one
        case "2": self.ratingCount = .two
        case "3": self.ratingCount = .three
        case "4": self.ratingCount = .four
        case "5": self.ratingCount = .five
        default:print("rating not found")
        }
    }
    
}
