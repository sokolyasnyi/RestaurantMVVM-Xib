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
        print(#function)
        self.repository = repository
        self.onSuccess = onSuccess
        self.onError = onError
        fetchRestaurants()
    }
    
    func fetchRestaurants() {
        print(#function)
        repository.getRestaurants { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let restaurantsData):
                print(restaurantsData)
                self.restaurantList = restaurantsData.filtredRestaurants
//                self.onSuccess(restaurantsData.restaurants)
            case .failure(let error):
                print(error)
                self.onError(error.localizedDescription)
            }
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filtredRestaurantList = restaurantList.filter({ (restaurant: Restaurant) -> Bool in
            return restaurant.name?.lowercased().contains(searchText.lowercased()) ?? false
        })
    }
    
}
