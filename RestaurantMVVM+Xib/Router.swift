//
//  Router.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 19.09.2023.
//

import UIKit

protocol RouterProtocol {
    var navigationController: UINavigationController? {get set}
    var assemblyBuilder: AsselderBuilderProtocol? {get set}
    func showStartModule()
    func showRestaurantListModule()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AsselderBuilderProtocol?

    init(navigationController: UINavigationController, assemblyBuilder: AsselderBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func showStartModule() {
        if let navigationController = navigationController {
            guard let startViewController = assemblyBuilder?.createStartModule(router: self) else { return }
            navigationController.pushViewController(startViewController, animated: true)
        }
    }
    
    func showRestaurantListModule() {
        print(#function)
    }
}



