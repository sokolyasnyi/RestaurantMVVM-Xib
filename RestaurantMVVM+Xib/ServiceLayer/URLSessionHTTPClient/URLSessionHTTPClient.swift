//
//  URLSessionHTTPClient.swift
//  RestaurantMVVM+Xib
//
//  Created by Станислав Соколов on 26.10.2023.
//

import Foundation

public final class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession
    
    public init(session: URLSession) {
        self.session = session
    }
    
    public func get(_ url: URL, responseHandler: @escaping (ResponseResult) -> Void) {
        session.dataTask(with: url) { data, response, error in
//            let handledResponse =
        }
    }
}


extension URLSessionHTTPClient {
    internal static func handle(data: Data?, error: Error?, response: URLResponse?) -> Result<Data, URLSessionHTTPClientError> {
        if let _data = data, error == nil, let _response = response, let _ = _response as? HTTPURLResponse {
            return .success(_data)
        }
        
        if let _error = error {
            return .failure(.error(_error))
        }
        return .failure(.unknown(data, response, error))
    }
}

