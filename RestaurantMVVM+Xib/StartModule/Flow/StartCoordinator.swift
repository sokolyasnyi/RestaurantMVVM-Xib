//
//  StartCoordinator.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 10.10.2023.
//

import UIKit

class StartCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var startViewController: StartViewController?
    private var restaurantListCoordinator: RestaurantListCoordinator?

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let startViewController = StartViewController(nibName: nil, bundle: nil)
        startViewController.delegate = self

        presenter.pushViewController(startViewController, animated: true)
        self.startViewController = startViewController
    }
}

//MARK: - StartViewControllerDelegate
extension StartCoordinator: StartViewControllerDelegate {
    func pressRestaurantButton() {
        
        let restaurantListCoordinator = RestaurantListCoordinator(presenter: presenter, environment: .dev)
        
        restaurantListCoordinator.start()
    }
    
    func pressCustomerButton() {
        print(#function)
    }
    
    
}
