//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by User on 15/11/22.
//

import UIKit

class ListDishesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var category: DishCategory!
    
    
    var dishes: [Dish] = [
        .init(id: "id1", name: "Fried Plantain ", image: "https://picsum.photos/100/200", description: "This is the best I have ever tasted", calories: 34.23 ),
        .init(id: "id2", name: "Suzmo", image: "https://picsum.photos/100/200", description: "This is the best I have ever tasted", calories: 35.23 ),
        .init(id: "id3", name: "Ratatui", image: "https://picsum.photos/100/200", description: "This is the best I have ever tasted", calories: 23.23 ),
        .init(id: "id4", name: "Kuurdak", image: "https://picsum.photos/100/200", description: "This is the best I have ever tasted", calories: 23.23 )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "\(category.name!)"
        
        registerCells()
    }
    
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
         
    }



}

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource{
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setUp(dish: dishes[indexPath.row])
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
