//
//  StartViewModel.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 19.09.2023.
//

import Foundation

protocol StartViewModelProtocol {
    init(router: RouterProtocol)
    func showRestaurantModule()
    func showCustomerModule()
    var router : RouterProtocol? { get set }

}

class StartViewModel: StartViewModelProtocol {
    var router : RouterProtocol?

    required init(router: RouterProtocol) {
        self.router = router
    }
    
    func showRestaurantModule() {
        print(#function)
    }
    
    func showCustomerModule() {
        print(#function)
    }
    
    
}
