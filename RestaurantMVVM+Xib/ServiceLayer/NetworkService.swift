//
//  NetworkService.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 20.09.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func dummyRestaurants() -> [Restaurant]
}

class NetworkService: NetworkServiceProtocol {
    func dummyRestaurants() -> [Restaurant] {
        let restaurant1 = Restaurant(id: "123", name: "ABC Restraunt1", desc: "123", ratingCount: .five, personCount: 3, isRecommended: true)
        let restaurant2 = Restaurant(id: "123", name: "ABC Restraunt2", desc: "123", ratingCount: .two, personCount: 3, isRecommended: false)
        let restaurant3 = Restaurant(id: "123", name: "ABC Restraunt3", desc: "123", ratingCount: .three, personCount: 3, isRecommended: true)
        let restaurant4 = Restaurant(id: "123", name: "ABC Restraunt4", desc: "123", ratingCount: .four, personCount: 3, isRecommended: true)
        
        return [restaurant1, restaurant2, restaurant3, restaurant4]
    }
}
