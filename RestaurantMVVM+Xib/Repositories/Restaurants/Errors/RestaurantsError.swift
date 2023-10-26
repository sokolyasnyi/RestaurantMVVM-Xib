//
//  RestaurantError.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 26.10.2023.
//

import Foundation

enum RestaurantsError: Error {
    case notParsable(Data)
    case fetchError(Error)
}
