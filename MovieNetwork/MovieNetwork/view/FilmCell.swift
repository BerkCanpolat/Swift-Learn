//
//  FilmCell.swift
//  MovieNetwork
//
//  Created by Berk Canpolat on 27.12.2023.
//

import UIKit

class FilmCell: UICollectionViewCell {
    
    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var filmRating: UILabel!
    
    func setup(_ model:FilmModel) {
        self.filmTitle.text = model.movie
        self.filmRating.text = "\(model.rating!)"
    }
    
}
