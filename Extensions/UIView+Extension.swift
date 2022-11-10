//
//  UIView+Extension.swift
//  Yummie
//
//  Created by User on 10/11/22.
//

import UIKit

extension UIView{
    @IBInspectable var cornerRadious: CGFloat{
        get{ return cornerRadious}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
