//
//  DetaySayfa.swift
//  FilmlerApp
//
//  Created by Berk Canpolat on 16.12.2023.
//

import UIKit
import Kingfisher

class DetaySayfa: UIViewController {
    
    @IBOutlet weak var labelDetayFilm: UILabel!
    @IBOutlet weak var imageViewDetay: UIImageView!
    @IBOutlet weak var labelFiyatDetay: UILabel!
    
    var film:Filmler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let f = film {
            labelDetayFilm.text = f.ad
            if let url = URL(string: "http://kasimadalan.pe.hu/filmler_yeni/resimler/\(f.resim!)") {
                DispatchQueue.main.async {
                    self.imageViewDetay.kf.setImage(with: url)
                }
            }

            labelFiyatDetay.text = "\(f.fiyat!) ₺"
        }
    }

}
