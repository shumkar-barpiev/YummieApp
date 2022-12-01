//
//  Route.swift
//  Yummie
//
//  Created by User on 19/11/22.
//

import Foundation

enum Route{
    static let baseURL = "https://yummie.glitch.me"
    case temp
    var description: String{
        switch self{
        case .temp:
            return "/dish-categories"
        }
    }
}
