//
//  DIContainer.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 10.10.2023.
//

import Foundation

protocol DIContainerProtocol {
    func register<Service>(_ type: Service.Type, service: Any)
    func resolve<Service>(_ type: Service.Type) -> Service
}

final class DIContainer: DIContainerProtocol {
    static let shared = DIContainer()
    private var services: [String: Any] = [:]
    
    private init() {}
    
    
    func register<Service>(_ type: Service.Type, service: Any) {
        let key = String(describing: Service.self)
        self.services[key] = service
    }
    
    func resolve<Service>(_ type: Service.Type) -> Service {
        let key = String(describing: type)
        guard let service = services[key] as? Service else {
            fatalError("\(type) service not registered")
        }
        return service
    }
    
}
