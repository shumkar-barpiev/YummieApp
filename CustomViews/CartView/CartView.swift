//
//  CartView.swift
//  Yummie
//
//  Created by User on 12/11/22.
//

import Foundation
import UIKit

class CartView: UIView{
    override init(frame: CGRect){
        super.init(frame: frame)
        initialSetup()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        cornerRadious = 10
        
    }
}
