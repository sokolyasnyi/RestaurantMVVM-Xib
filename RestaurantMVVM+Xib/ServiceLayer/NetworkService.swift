//
//  NetworkService.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 20.09.2023.
//

import Foundation


protocol NetworkServiceProtocol {
    func searchRestaurants(completion: @escaping (Result<[Restaurant]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    enum HTTPMethods: String {
        case POST
        case GET
        case PUT
        case DELETE
    }
    
    let baseURL = "https://ratings.food.gov.uk/api/"
    
    
    func searchRestaurants(completion: @escaping (Result<[Restaurant]?, Error>) -> Void) {
        print(#function)

        if let url = URL(string: baseURL + "open-data-files/FHRS529en-GB.json") {
            
            URLSession.shared.dataTask(with: url) { (data, response, error) -> Void in
                
                if error != nil {
                    print("Error: \(String(describing: error?.localizedDescription))")
                } else {
                    if let resp = response as? HTTPURLResponse, resp.statusCode == 200 {
                        if let responseData = data {
                            let root = try? JSONDecoder().decode(Root.self, from: responseData)
                            if let establishmentCollection = root?.FHRSEstablishment.establishmentCollection {
                                let restaurants = self.parseRestaurnatDataToArray(data:establishmentCollection)
                                print(restaurants)
                            }
                        }
                        
//                        let responseData = try? JSONDecoder().decode(Root.self, from: data)
//                        if let responseData = responseData {
//                            completion(.success(restaurants))
//                        }
                    } else {
                        let temp = response as? HTTPURLResponse
                        print(temp?.statusCode as Any)
                    }
                }
                
            }.resume()
        }
        
    }
}


//MARK: - Parsing data
extension NetworkService {
    private func parseRestaurnatDataToArray(data: Array<EstablishmentCollection>) -> Array<Restaurant> {
        
        let array = data.map { doc -> Restaurant in
            let restaurant = Restaurant(data: doc)
            return restaurant
        }
        return array
    }
}
