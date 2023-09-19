//
//  StartViewModel.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 19.09.2023.
//

import Foundation

protocol StartViewModelProtocol {
    init()
    func showRestaurantModule()
    func showCustomerModule()
}

class StartViewModel: StartViewModelProtocol {
    required init() {}
    
    func showRestaurantModule() {
        print(#function)
    }
    
    func showCustomerModule() {
        print(#function)
    }
    
    
}
