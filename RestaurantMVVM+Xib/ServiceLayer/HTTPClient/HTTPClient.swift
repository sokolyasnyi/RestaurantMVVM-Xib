//
//  HttpClient.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 26.10.2023.
//

import Foundation

public protocol HTTPClient {
    typealias ResponseResult = Result<Data, Error>
    func get(_ url: URL, responseHandler: @escaping (ResponseResult) -> Void)
}
