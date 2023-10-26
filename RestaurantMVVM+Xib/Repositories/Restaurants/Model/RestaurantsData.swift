//
//  RestaurantsData.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 26.10.2023.
//

import Foundation

struct RestaurantsData {
    let restaurants: [Restaurant]
    var filtredRestaurants: [Restaurant] {
        let array = restaurants.filter { doc in
            if doc.businessType == "Restaurant/Cafe/Canteen" {
                return true
            } else {
                return false
            }
        }
        return array
    }
}

extension RestaurantsData {
    static var empty: RestaurantsData { RestaurantsData(restaurants: [.init(id: "1", name: "1", businessType: "1", ratingCount: .one, address: "1", isRecommended: false)])}
}
