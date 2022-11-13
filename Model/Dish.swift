//
//  Dish.swift
//  Yummie
//
//  Created by User on 13/11/22.
//

import Foundation

struct Dish{
    let id: String?
    let name: String?
    let image: String?
    let description: String?
    let calories: Double?
    
    var formattedCalories:String{
        return String(format: "%.2f calories", arguments: [calories ?? 0])
    }
}
