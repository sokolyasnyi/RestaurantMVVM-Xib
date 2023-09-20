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
    let id: String
    let name: String
    let desc: String
    let ratingCount: RatingsStars
    let personCount: Int
    let isRecommended: Bool
}
