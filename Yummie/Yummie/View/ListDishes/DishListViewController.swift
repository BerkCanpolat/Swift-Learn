//
//  DishListViewController.swift
//  Yummie
//
//  Created by Berk Canpolat on 27.01.2025.
//

import UIKit

class DishListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var category: DishCategory?
    
    var dish:[Dish] = [
        .init(id: "id1", name: "Garri", description: "This is the best I have Ever Tasted", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id1", name: "Indomie", description: "This is the best I have Ever Tasted This is the best I have Ever Tasted This is the best I have Ever Tasted This is the best I have Ever Tasted This is the best I have Ever Tasted This is the best I have Ever Tasted This is the best I have Ever Tasted ", image: "https://picsum.photos/100/200", calories: 314),
        .init(id: "id1", name: "Pizza", description: "This is the best I have Ever Tasted", image: "https://picsum.photos/100/200", calories: 66),
        .init(id: "id1", name: "garri", description: "This is the best I have Ever Tasted", image: "https://picsum.photos/100/200", calories: 24),
        .init(id: "id1", name: "garri", description: "This is the best I have Ever Tasted", image: "https://picsum.photos/100/200", calories: 43)
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = category?.name
        registerCells()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    

    

}

extension DishListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dish.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(dish: dish[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dish[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
