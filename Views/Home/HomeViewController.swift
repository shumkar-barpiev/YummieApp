//
//  HomeViewController.swift
//  Yummie
//
//  Created by User on 12/11/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var specialCollectionView: UICollectionView!
    
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "African Dish 1", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "African Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "African Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "African Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "African Dish 5", image: "https://picsum.photos/100/200"),
    ]
    
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Spagetti ", image: "https://picsum.photos/100/200", description: "This is the best I have ever tasted", calories: 34.23 ),
        .init(id: "id2", name: "Pizza", image: "https://picsum.photos/100/200", description: "This is the best I have ever tasted", calories: 35.23 ),
        .init(id: "id3", name: "Ratatui", image: "https://picsum.photos/100/200", description: "This is the best I have ever tasted", calories: 23.23 )
    ]
    
    var specials: [Dish] = [
        .init(id: "id1", name: "Fried Plantain ", image: "https://picsum.photos/100/200", description: "This is the best I have ever tasted", calories: 34.23 ),
        .init(id: "id2", name: "Suzmo", image: "https://picsum.photos/100/200", description: "This is the best I have ever tasted", calories: 35.23 ),
        .init(id: "id3", name: "Ratatui", image: "https://picsum.photos/100/200", description: "This is the best I have ever tasted", calories: 23.23 ),
        .init(id: "id4", name: "Kuurdak", image: "https://picsum.photos/100/200", description: "This is the best I have ever tasted", calories: 23.23 )
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        specialCollectionView.dataSource = self
        specialCollectionView.delegate = self
        
        registerCells()
    }
    
    
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        specialCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView{
            case categoryCollectionView:
                return categories.count
            case popularCollectionView:
                return populars.count
            case specialCollectionView:
                return specials.count
            default:
                return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
            case categoryCollectionView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
                cell.setUp(category: categories[indexPath.row])
                
                return cell
            case popularCollectionView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
                cell.setUp(dish: populars[indexPath.row])
                
                return cell
            case specialCollectionView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
                cell.setUp(dish: specials[indexPath.row])
                return cell
            default:
                return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView{
            
        }else{
            let controller = DishDetailViewController.instantiate()
            
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
