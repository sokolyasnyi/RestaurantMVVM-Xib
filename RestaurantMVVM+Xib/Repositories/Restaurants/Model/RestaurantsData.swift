//
//  RestaurantsData.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 26.10.2023.
//

import Foundation

struct RestaurantsData {
    let restaurants: [Restaurant]
}

extension RestaurantsData {
    static var empty: RestaurantsData { RestaurantsData(restaurants: [.init(id: "1", name: "1", ratingCount: .one, address: "1", isRecommended: false)])}
}
