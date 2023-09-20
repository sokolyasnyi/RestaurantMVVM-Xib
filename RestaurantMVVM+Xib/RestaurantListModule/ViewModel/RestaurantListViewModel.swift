//
//  RestaurantListViewModel.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 19.09.2023.
//

import Foundation

protocol RestaurantListViewModelProtocol {
    init(router: RouterProtocol)
    var restaurantList: [Restaurant] {get set}
    func fetchRestaurantList()

}

enum RestaurantListViewState {
    case loading
    case dataFetched
    case error
}

class RestaurantListViewModel: RestaurantListViewModelProtocol {
    
    var router: RouterProtocol?
    var stateChangeHandler: ((RestaurantListViewState) -> Void)?
    
    var restaurantList: [Restaurant] = [] {
        didSet {
            stateChangeHandler?(.dataFetched)
        }
    }
    
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
    
    required init(router: RouterProtocol) {
        self.router = router
        fetchRestaurantList()
    }

    func fetchRestaurantList() {
        isLoading = true
        //TODO: - Get mock data
    }

}
