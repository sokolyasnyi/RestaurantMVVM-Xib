//
//  AsselderModelBuiler.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 19.09.2023.
//

import UIKit

protocol AsselderBuilderProtocol {
    func createStartModule(router: RouterProtocol) -> UIViewController
    func createRestaurantListModule(router: RouterProtocol) -> UIViewController
}

class AsselderModelBuiler: AsselderBuilderProtocol {
    func createStartModule(router: RouterProtocol) -> UIViewController {
        let view = StartViewController()
        let viewModel = StartViewModel(router: router)
        view.viewModel = viewModel
        return view
    }
    func createRestaurantListModule(router: RouterProtocol) -> UIViewController {
        let view = RestaurantListViewController()
        let viewModel = RestaurantListViewModel(router: router)
        view.viewModel = viewModel
        return view
    }
}
