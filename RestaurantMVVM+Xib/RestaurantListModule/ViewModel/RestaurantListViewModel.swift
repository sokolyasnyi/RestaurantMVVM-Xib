//
//  RestaurantListViewModel.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 19.09.2023.
//

import Foundation

protocol RestaurantListViewModelProtocol {
    init(repository: RestaurantsRepository,
         onSuccess: @escaping (_ restaurants: [Restaurant]) -> Void,
         onError: @escaping (_ errorMessage: String) -> Void
    )
    
    var restaurantList: [Restaurant] {get set}
    var filtredRestaurantList: [Restaurant]? {get set}
    var stateChangeHandler: ((RestaurantListViewState) -> Void)? {get set}
//    func fetchRestaurantList()
    func filterContentForSearchText(_ searchText: String)

}

enum RestaurantListViewState {
    case loading
    case dataFetched
    case error
}

final class RestaurantListViewModel: RestaurantListViewModelProtocol {
    
    private let repository: RestaurantsRepository
    private let onSuccess: (_ restaurants: [Restaurant]) -> Void
    private let onError: (_ errorMessage: String) -> Void
    
    var stateChangeHandler: ((RestaurantListViewState) -> Void)?
    
    
    var networkService: NetworkServiceProtocol?
    
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
    
    init(repository: RestaurantsRepository, onSuccess: @escaping ([Restaurant]) -> Void, onError: @escaping (String) -> Void) {
        self.repository = repository
        self.onSuccess = onSuccess
        self.onError = onError
        fetchRestaurants()
    }
    
    func fetchRestaurants() {
        repository.getRestaurants { [weak self] result in
            switch result {
            case .success(let restaurantsData):
                print(restaurantsData)
                self?.onSuccess(restaurantsData.restaurants)
            case .failure(let error):
                self?.onError(error.localizedDescription)
            }
        }
    }
    
    /*
    required init(networkService: NetworkServiceProtocol = DIContainer.shared.resolve(NetworkServiceProtocol.self)) {
        self.networkService = networkService
        fetchRestaurantList()
    }
    
    
    
    func fetchRestaurantList() {
        isLoading = true
        DispatchQueue.global(qos: .default).async {
            self.networkService?.searchRestaurants(completion: { [weak self] result in
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
        print(#function)

    }
     */
    
    func filterContentForSearchText(_ searchText: String) {
        filtredRestaurantList = restaurantList.filter({ (restaurant: Restaurant) -> Bool in
            return restaurant.name?.lowercased().contains(searchText.lowercased()) ?? false
        })
    }
    
}
