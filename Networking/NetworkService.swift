//
//  NetworkService.swift
//  Yummie
//
//  Created by User on 19/11/22.
//

import Foundation

struct NetworkService{
    
    static let shared = NetworkService()
    
    private init() {}
    
    func myFirstRequest(completion: @escaping (Result<String, Error>) -> Void){
        request(route: .temp, method: .get, completion: completion)
    }
    
    private func request<T:Codable>(route: Route, method: Method, parameters: [String: Any]? = nil, completion: @escaping (Result< T, Error>) -> Void){
        
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        URLSession.shared.dataTask(with: request){data, response, error in
            var result: Result<Data, Error>?
            if let data = data{
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "could not stringify our data!!!"
                
                print("Response is\n: \(responseString)")
            }else if let error = error {
                result = .failure(error)
                print("The error is: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                // To do our result  and sent back to the user
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
        
    }
    
    private func  handleResponse<T: Decodable>(result: Result<Data, Error>?,
                                               completion: (Result<T,Error>)->Void){
        guard let result = result else{
            completion(.failure(AppError.unknownError))
            return
        }
        
        switch result{
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponse<T>.self
                                                     , from: data) else{
                completion(.failure(AppError.errorDecoding))
                return
            }
            
            if let error = response.error{
                completion(.failure(AppError.serverError(error)))
                return
            }
            
            if let decodedData = response.data{
                completion(.success(decodedData))
            }else{
                completion(.failure(AppError.errorDecoding))
                return
            }
        case .failure(let error):
            completion(.failure(error))
        }
        
    }
    
    
    /// This function helps us to generate urlRequest                       creating like this description short cut is: command+alt+/
    /// - Parameters:
    ///   - route: the path to the resource in the backend
    ///   - method: type of request to be made
    ///   - parameters: whatever extra information you need to pass to the backend
    /// - Returns: urlRequest
    private  func createRequest(route: Route, method: Method, parameters: [String: Any]? = nil) -> URLRequest?{
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
