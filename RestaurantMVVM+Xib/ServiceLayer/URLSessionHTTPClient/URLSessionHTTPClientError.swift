//
//  URLSessionHTTPClientError.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 26.10.2023.
//

import Foundation

public enum URLSessionHTTPClientError: Error {
    case error(Error)
    case unknown(Data?, URLResponse?, Error?)
}
