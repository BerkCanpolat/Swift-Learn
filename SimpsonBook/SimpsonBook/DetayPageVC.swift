//
//  DetayPageVC.swift
//  SimpsonBook
//
//  Created by Berk Canpolat on 24.11.2023.
//

import UIKit

class DetayPageVC: UIViewController {
    
    
    @IBOutlet weak var detayImage: UIImageView!
    
    @IBOutlet weak var jobLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var simpsonDetay: Model?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detayImage.image = simpsonDetay?.resim
        jobLabel.text = simpsonDetay?.meslek
        nameLabel.text = simpsonDetay?.ad

        
    }

}
