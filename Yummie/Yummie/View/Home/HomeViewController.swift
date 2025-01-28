//
//  HomeViewController.swift
//  Yummie
//
//  Created by Berk Canpolat on 26.01.2025.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView! {
        didSet {
            categoryCollectionView.delegate = self
            categoryCollectionView.dataSource = self
        }
    }
    
    @IBOutlet weak var popularCollectionView: UICollectionView! {
        didSet {
            popularCollectionView.delegate = self
            popularCollectionView.dataSource = self
        }
    }
    
    
    @IBOutlet weak var specialCollectionView: UICollectionView! {
        didSet {
            specialCollectionView.delegate = self
            specialCollectionView.dataSource = self
        }
    }
    
    var categories: [DishCategory] = []
    var populars: [Dish] = []
    var specials: [Dish] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProgressHUD.animate()
        NetworServiceManager.shared.fetchAllCategories { [weak self] result in
            switch result {
            case .success(let allDishes):
                print("It wa successful")
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.specialCollectionView.reloadData()
            case .failure(let error):
                print("The error is: \(error.localizedDescription)")
                ProgressHUD.error(error.localizedDescription)
            }
        }
        
       title = "Yummie"
        registerCell()
    }
    
    private func registerCell() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        specialCollectionView.register(UINib(nibName: DishLandScapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandScapeCollectionViewCell.identifier)
    }


}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialCollectionView:
            return specials.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        case specialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandScapeCollectionViewCell.identifier, for: indexPath) as! DishLandScapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell

        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = DishListViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
