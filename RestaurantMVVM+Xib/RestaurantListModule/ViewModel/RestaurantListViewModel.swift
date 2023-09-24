//
//  RestaurantListViewModel.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 19.09.2023.
//

import Foundation

protocol RestaurantListViewModelProtocol {
    init(router: RouterProtocol, networkService: NetworkServiceProtocol)
    var restaurantList: [Restaurant] {get set}
    var filtredRestaurantList: [Restaurant]? {get set}
    var stateChangeHandler: ((RestaurantListViewState) -> Void)? {get set}
    func fetchRestaurantList()
    func filterContentForSearchText(_ searchText: String)

}

enum RestaurantListViewState {
    case loading
    case dataFetched
    case error
}

class RestaurantListViewModel: RestaurantListViewModelProtocol {
    
    
    var router: RouterProtocol?
    var networkService: NetworkServiceProtocol?
    var stateChangeHandler: ((RestaurantListViewState) -> Void)?
    
    var restaurantList: [Restaurant] = [] {
        didSet {
            stateChangeHandler?(.dataFetched)
        }
    }
    var filtredRestaurantList: [Restaurant]?
    
    var error: Error? {
        didSet {
            stateChangeHandler?(.error)
        }
    }

    var isLoading: Bool = false {
        didSet {
            stateChangeHandler?(.loading)
        }
    }
    
    required init(router: RouterProtocol, networkService: NetworkServiceProtocol) {
        self.router = router
        self.networkService = networkService
        fetchRestaurantList()
    }

    func fetchRestaurantList() {
        isLoading = true
        //TODO: - Get mock data
        
        print(#function)
        networkService?.searchRestaurants(completion: { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let restaurants):
                    if let restaurants = restaurants {
                        self.restaurantList = restaurants
                        print("Count restaurant \(self.restaurantList.count)")
                    }
                case .failure(let error):
                    self.error = error

                }
            }
            
        })

    }
    
    func filterContentForSearchText(_ searchText: String) {
        filtredRestaurantList = restaurantList.filter({ (restaurant: Restaurant) -> Bool in
            return restaurant.name?.lowercased().contains(searchText.lowercased()) ?? false
        })
    }
    
}
