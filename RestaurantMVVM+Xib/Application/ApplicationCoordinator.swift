//
//  ApplicationCoordinator.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 10.10.2023.
//

import UIKit

protocol Coordinator {
    func start()
}

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    let rootViewController: UINavigationController
    let startCoordinator: StartCoordinator
    
    init(window: UIWindow) {
        self.window = window
        self.rootViewController = UINavigationController()
    
        startCoordinator = StartCoordinator(presenter: rootViewController)
        startCoordinator.start()
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
