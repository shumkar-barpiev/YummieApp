//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by User on 12/11/22.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    static let identifier = "CategoryCollectionViewCell"
    
    func setUp(category: DishCategory){
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asURL)
        
    }

}
