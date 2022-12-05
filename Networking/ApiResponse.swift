//
//  ApiResponse.swift
//  Yummie
//
//  Created by User on 1/12/22.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable{
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
