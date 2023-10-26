//
//  RestaurantListCoordinator.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 10.10.2023.
//

import UIKit

class RestaurantListCoordinator: Coordinator {
    private let presenter: UINavigationController
    private let environment: RestaurantsAPI
    private var restaurantListViewController: RestaurantListViewController?
    private var viewModel: RestaurantListViewModelProtocol?
    
    init(presenter: UINavigationController, environment: RestaurantsAPI) {
        self.presenter = presenter
        self.environment = environment
    }
    
    func start() { 
        let restaurantListViewController = RestaurantListViewController(nibName: nil, bundle: nil)
        
        let viewModel = makeViewModel(repository: makeRepository(environment: environment),
    onSuccess: { [weak restaurantListViewController]  in
            
            restaurantListViewController?.onSuccess($0)
            
        }, onError: { [weak restaurantListViewController] in
            
            restaurantListViewController?.onError(errorMessage: $0)
            
        })
        self.viewModel = viewModel

        restaurantListViewController.viewModel = viewModel
        presenter.pushViewController(restaurantListViewController, animated: true)
        self.restaurantListViewController = restaurantListViewController
    }
    
}

fileprivate extension RestaurantListCoordinator {
    func makeRepository(environment: RestaurantsAPI) -> RestaurantsRepository {
        let urlSessionHTTPClient = DIContainer.shared.resolve(HTTPClient.self)
        return RestaurantsRemoteRepository(httpClient: urlSessionHTTPClient,
                                    api: environment)
    }
    
    func makeViewModel(repository: RestaurantsRepository,
                       onSuccess: @escaping (_ restuarants: [Restaurant]) -> Void,
                       onError: @escaping (_ error: String) -> Void)
    -> RestaurantListViewModel {
        RestaurantListViewModel(repository: repository, onSuccess: onSuccess, onError: onError)
    }
}
