//
//  DetaySayfa.swift
//  FilmlerApp
//
//  Created by Berk Canpolat on 16.12.2023.
//

import UIKit

class DetaySayfa: UIViewController {
    
    @IBOutlet weak var labelDetayFilm: UILabel!
    @IBOutlet weak var imageViewDetay: UIImageView!
    @IBOutlet weak var labelFiyatDetay: UILabel!
    
    var film:Filmler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let f = film {
            labelDetayFilm.text = f.ad
            imageViewDetay.image = UIImage(named: f.resim!)
            labelFiyatDetay.text = "\(f.fiyat!) ₺"
        }
    }

}
