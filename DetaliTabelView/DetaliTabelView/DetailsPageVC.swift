//
//  DetailsPageVC.swift
//  DetaliTabelView
//
//  Created by Berk Canpolat on 22.11.2023.
//

import UIKit

class DetailsPageVC: UIViewController {
    
    //MARK: - UIElements
    @IBOutlet weak var detailsResim: UIImageView!
    @IBOutlet weak var detailsYemek: UILabel!
    @IBOutlet weak var detailsFiyat: UILabel!
    
    
    //MARK: - Propertys
    var detailsPage: Yemekler?
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsYemek.text = detailsPage?.yemekAdi
        detailsFiyat.text = "\(detailsPage?.yemekFiyat ?? 99.99)"
        detailsResim.image = UIImage(named: detailsPage?.yemekResim ?? "Boş")

        
    }
    


}
