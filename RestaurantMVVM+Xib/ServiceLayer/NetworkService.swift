//
//  NetworkService.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 20.09.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func createHeaders() -> [String : String]
    func searchRestaurants(completion: @escaping (Result<[Restaurant]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func createHeaders() -> [String : String] {
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "X-RapidAPI-Key": "3e5495a31amshdc98c04fa06273dp1992d2jsn01b269a467e3",
            "X-RapidAPI-Host": "restaurants222.p.rapidapi.com"
        ]
        return headers
    }

    
    func searchRestaurants(completion: @escaping (Result<[Restaurant]?, Error>) -> Void) {
        print(#function)
        let headers = createHeaders()

        let postData = NSMutableData(data: "location_id=297704".data(using: String.Encoding.utf8)!)
        postData.append("&language=en_US".data(using: String.Encoding.utf8)!)
        postData.append("&currency=USD".data(using: String.Encoding.utf8)!)
        postData.append("&offset=0".data(using: String.Encoding.utf8)!)

        let request = NSMutableURLRequest(url: NSURL(string: "https://restaurants222.p.rapidapi.com/search")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard error == nil else {
                print(error?.localizedDescription as Any)
                return }
            guard let data = data else { return }
            do {
                
                let decoder = JSONDecoder()
                let response = try decoder.decode(Root.self, from: data)
                
                let restaurants = self.parseRestaurnatDataToArray(data: response.results.data)
                completion(.success(restaurants))

            } catch {
                print(error)
                completion(.failure(error))
            }
        })

        dataTask.resume()
        


    }
    
}


//MARK: - Parsing data
extension NetworkService {
    private func parseRestaurnatDataToArray(data: Array<Rest>) -> Array<Restaurant> {
        
        let array = data.map { doc -> Restaurant in
            let restaurant = Restaurant(data: doc)
            return restaurant
        }
        return array
    }
}
