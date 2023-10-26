//
//  RestaurantsAPI+EnvironmentInstancesExtension.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 26.10.2023.
//

import Foundation

extension RestaurantsAPI {
    static var dev: Self {
        RestaurantsAPI(environment: RestaurantsEnvironment())
    }
}
