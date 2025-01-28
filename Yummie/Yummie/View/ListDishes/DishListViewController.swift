//
//  DishListViewController.swift
//  Yummie
//
//  Created by Berk Canpolat on 27.01.2025.
//

import UIKit
import ProgressHUD

class DishListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var category: DishCategory?
    
    var dish:[Dish] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = category?.name
        registerCells()
        
        ProgressHUD.animate()
        NetworServiceManager.shared.fetchCategoryDishes(categoryId: category?.id ?? "") { [weak self] result in
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dish = dishes
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
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
