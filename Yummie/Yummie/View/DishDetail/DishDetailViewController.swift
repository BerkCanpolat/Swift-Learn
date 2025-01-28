//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by Berk Canpolat on 27.01.2025.
//

import UIKit
import ProgressHUD

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
    

    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.error("Please enter your name")
            return
        }
        print("Hello, \(name)")
        
        ProgressHUD.animate("Placing Order...")
        NetworServiceManager.shared.placeOrder(dishId: dish?.id ?? "", name: name) { result in
            switch result {
            case .success(_):
                ProgressHUD.success("Your order has been received 👨‍🍳")
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
    }
    

}
