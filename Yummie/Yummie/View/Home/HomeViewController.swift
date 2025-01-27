//
//  HomeViewController.swift
//  Yummie
//
//  Created by Berk Canpolat on 26.01.2025.
//

import UIKit

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
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 5", image: "https://picsum.photos/100/200")
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Garri", description: "This is the best I have Ever Tasted", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id1", name: "Indomie", description: "This is the best I have Ever Tasted This is the best I have Ever Tasted This is the best I have Ever Tasted This is the best I have Ever Tasted This is the best I have Ever Tasted This is the best I have Ever Tasted This is the best I have Ever Tasted ", image: "https://picsum.photos/100/200", calories: 314),
        .init(id: "id1", name: "Pizza", description: "This is the best I have Ever Tasted", image: "https://picsum.photos/100/200", calories: 66),
        .init(id: "id1", name: "garri", description: "This is the best I have Ever Tasted", image: "https://picsum.photos/100/200", calories: 24),
        .init(id: "id1", name: "garri", description: "This is the best I have Ever Tasted", image: "https://picsum.photos/100/200", calories: 43)
    ]
    
    var specials: [Dish] = [
        .init(id: "id1", name: "Fried Plantain", description: "This is the best I have Ever Tasted", image: "https://picsum.photos/100/200", calories: 24),
        .init(id: "id1", name: "Beans and Garri", description: "This is the best I have Ever Tasted", image: "https://picsum.photos/100/200", calories: 43)
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
            
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
