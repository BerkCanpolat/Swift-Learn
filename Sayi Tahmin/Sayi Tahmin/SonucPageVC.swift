//
//  SonucPageVC.swift
//  Sayi Tahmin
//
//  Created by Berk Canpolat on 23.11.2023.
//

import UIKit

class SonucPageVC: UIViewController {
    
    //MARK: - UIElements
    
    @IBOutlet weak var sonucImage: UIImageView!
    @IBOutlet weak var sonucLabel: UILabel!
    
    //MARK: - Propertys
    var sonuc:Bool?
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        if sonuc! == true {
            sonucImage.image = UIImage(named: "mutlu")
            sonucLabel.text = "Kazandınız!"
        } else {
            sonucImage.image = UIImage(named: "uzgun")
            sonucLabel.text = "Kaybettiniz!"
        }

        
    }
    
    
    @IBAction func tekrarOynaButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
