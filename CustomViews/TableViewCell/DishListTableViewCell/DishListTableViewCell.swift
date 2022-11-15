//
//  DishListTableViewCell.swift
//  Yummie
//
//  Created by User on 14/11/22.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    static let identifier = String(describing: DishListTableViewCell.self)
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setUp(dish: Dish){
        dishTitleLabel.text = dish.name
        descriptionLabel.text = dish.description
        dishImageView.kf.setImage(with: dish.image?.asURL)
        
    }
    
}
