//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by User on 14/11/22.
//

import UIKit

class DishDetailViewController: UIViewController {
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishTitleLabel: UILabel!
    @IBOutlet weak var dishCaloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    var dish: Dish!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    
    private func populateView(){
        dishImageView.kf.setImage(with: dish.image?.asURL)
        dishTitleLabel.text = dish.name
        dishCaloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description

    }
    
    @IBAction func placeOrderButtonClicked(_ sender: Any) {
    }
    
    
}
