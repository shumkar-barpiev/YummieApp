//
//  DishLandscapeCollectionViewCell.swift
//  Yummie
//
//  Created by User on 13/11/22.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: DishLandscapeCollectionViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    
    func setUp(dish: Dish){
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
        dishImageView.kf.setImage(with: dish.image?.asURL)
    }
}
