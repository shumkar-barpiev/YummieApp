//
//  String+Extension.swift
//  Yummie
//
//  Created by User on 12/11/22.
//

import Foundation
extension String{
    var asURL: URL?{
        return URL(string: self)
    }
}
