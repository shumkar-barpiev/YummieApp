//
//  UIViewController+Extension.swift
//  Yummie
//
//  Created by User on 14/11/22.
//

import Foundation
import UIKit


extension UIViewController{
    
    static var  identifier: String{
        return String(describing: self)
    }
    
    
    static func instantiate() -> Self{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        
        return controller
    }
    
}
