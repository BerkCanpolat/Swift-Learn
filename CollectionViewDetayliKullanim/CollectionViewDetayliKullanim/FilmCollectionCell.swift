//
//  FilmCollectionCell.swift
//  CollectionViewDetayliKullanim
//
//  Created by Berk Canpolat on 22.11.2023.
//

import UIKit

//MARK: - Protocol
protocol filmlerMainProtocol {
    func filmlerFuncProtocol(indexPath:IndexPath)
}

class FilmCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var filmResim: UIImageView!
    @IBOutlet weak var filmIsim: UILabel!
    @IBOutlet weak var filmFiyat: UILabel!
    
    //MARK: - Propertys
    var ulasProtocol:filmlerMainProtocol?
    var ulasIndex:IndexPath?
    
    
    
    
    @IBAction func filmButton(_ sender: Any) {
        ulasProtocol?.filmlerFuncProtocol(indexPath: ulasIndex!)
    }
    
    
    
}
