//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by Berk Canpolat on 27.01.2025.
//

import UIKit

class DishDetailViewController: UIViewController {
    
    @IBOutlet weak var dishImaveView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish:Dish?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    
    private func populateView() {
        dishImaveView.kf.setImage(with: dish?.image?.asUrl)
        titleLbl.text = dish?.name
        caloriesLbl.text = dish?.formattedCalories
        descriptionLbl.text = dish?.description
    }
    

    @IBAction func placeOrderBtnClicked(_ sender: Any) {
    }
    

}
