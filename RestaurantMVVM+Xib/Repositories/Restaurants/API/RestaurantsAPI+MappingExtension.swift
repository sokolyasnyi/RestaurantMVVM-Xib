//
//  RestaurantsAPI+MappingExtension.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 26.10.2023.
//

import Foundation

extension RestaurantsAPI {
    var restaurantsURL: URL {
        getURL(path: "open-data-files/FHRS529en-GB.json")
    }
}

fileprivate extension RestaurantsAPI {
    func getURL(path: String) -> URL {
        URL(string: "\(environment.baseURL)/\(path)")!
    }
    
}
