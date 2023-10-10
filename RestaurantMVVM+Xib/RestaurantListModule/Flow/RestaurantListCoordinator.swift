//
//  RestaurantListCoordinator.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 10.10.2023.
//

import UIKit

class RestaurantListCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var restaurantListViewController: RestaurantListViewController?
    private let networkSerivce: NetworkServiceProtocol
    private let viewModel: RestaurantListViewModelProtocol
    
    init(presenter: UINavigationController, networkSerivce: NetworkServiceProtocol, viewModel: RestaurantListViewModelProtocol) {
        self.presenter = presenter
        self.networkSerivce = networkSerivce
        self.viewModel = viewModel
    }
    
    func start() {
        let restaurantListViewController = RestaurantListViewController(nibName: nil, bundle: nil)
        restaurantListViewController.viewModel = viewModel
        presenter.pushViewController(restaurantListViewController, animated: true)
        self.restaurantListViewController = restaurantListViewController
    }
}
