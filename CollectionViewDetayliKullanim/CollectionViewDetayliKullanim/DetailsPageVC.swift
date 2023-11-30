//
//  DetailsPageVC.swift
//  CollectionViewDetayliKullanim
//
//  Created by Berk Canpolat on 22.11.2023.
//

import UIKit

class DetailsPageVC: UIViewController {
    
    //MARK: - UIElements
    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var detailsFiyat: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    
    //MARK: - Propertys
    var detailsPage: Filmler?
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsLabel.text = detailsPage?.filmAdi
        detailsFiyat.text = "\(detailsPage?.filmFiyati ?? 99.99)"
        detailsImage.image = UIImage(named: detailsPage?.filmResim ?? "Boş")

        
    }

}
