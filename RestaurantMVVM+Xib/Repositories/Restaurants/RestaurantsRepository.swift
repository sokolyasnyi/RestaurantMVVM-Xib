//
//  RestaurantsRepository.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 26.10.2023.
//

import Foundation

protocol RestaurantsRepository {
    typealias RestaurantResult = Result<RestaurantsData, RestaurantsError>
    func getRestaurants(handler: @escaping (RestaurantResult) -> Void)
}
