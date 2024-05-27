//
//  FilmlerHucre.swift
//  FilmlerApp
//
//  Created by Berk Canpolat on 16.12.2023.
//

import UIKit

protocol HucreProtocol {
    func sepeteTiklandi(indexPath:IndexPath)
}

class FilmlerHucre: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelFiyat: UILabel!
    
    var hucreUlasProtocol:HucreProtocol?
    var indexUlas:IndexPath?
    
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        hucreUlasProtocol?.sepeteTiklandi(indexPath: indexUlas!)
    }
    
}
