//
//  NetworkService.swift
//  Yummie
//
//  Created by User on 19/11/22.
//

import Foundation

struct NetworkService{
    /// This function helps us to generate urlRequest                       creating like this description short cut is: command+alt+/
    /// - Parameters:
    ///   - route: the path to the resource in the backend
    ///   - method: type of request to be made
    ///   - parameters: whatever extra information you need to pass to the backend
    /// - Returns: urlRequest
    func createRequest(route: Route, method: Method, parameters: [String: Any]? = nil) -> URLRequest?{
        let urlString = Route.baseURL + route.description
        guard let url = urlString.asURL else{ return nil}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters{
            switch method{
                case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)")}
                urlRequest.url = urlComponent?.url
                case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
                
            }
        }
        
        return urlRequest
    }
}
