//
//  RestaurantsRemoteRepository.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 26.10.2023.
//

import Foundation

final internal class RestaurantsRemoteRepository: RestaurantsRepository {
    
    private let httpClient: HTTPClient
    private let api: RestaurantsAPI
    
    internal init(httpClient: HTTPClient, api: RestaurantsAPI) {
        self.httpClient = httpClient
        self.api = api
    }
    
    func getRestaurants(handler: @escaping (RestaurantResult) -> Void) {
        httpClient.get(api.restaurantsURL) { [weak self] result in
            switch result {
            case .success(let data):
                if let dto = Self.parse(type: RestaurantsDTO.self, data: data) {
                    handler(.success(dto.toData))
                } else {
                    handler(.failure(.notParsable(data)))
                }
            case .failure(let error):
                handler(.failure(.fetchError(error)))
            }
        }
    }
    
    
    private static func parse<T: Decodable>(type: T.Type, data: Data) -> T? {
        return try? JSONDecoder().decode(T.self, from: data)
    }
}

fileprivate extension RestaurantsDTO {
    var toData: RestaurantsData {
        return RestaurantsData(restaurants: parseRestaurantsDataToArray(data: FHRSEstablishment.establishmentCollection))
    }
    
    
    func parseRestaurantsDataToArray(data: [EstablishmentCollection]?) -> Array<Restaurant> {
        
        guard let data = data else { return [] }
        
        let array = data.filter { doc in
            guard let businessType = doc["BusinessType"] as? String else { return false}
            if businessType == "Restaurant/Cafe/Canteen" {
                return true
            } else {
                return false
            }
        }.map { doc -> Restaurant in
            let restaurant = Restaurant(data: doc)
            return restaurant
        }
        return array
        
    }
}
