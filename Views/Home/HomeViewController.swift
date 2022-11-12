//
//  HomeViewController.swift
//  Yummie
//
//  Created by User on 12/11/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "African Category 1", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "African Category 2", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "African Category 3", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "African Category 4", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "African Category 5", image: "https://picsum.photos/100/200"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()

    }
    
    
    private func registerCells(){
        
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        
        cell.setUp(category: categories[indexPath.row])
        
        return cell
    }
}
