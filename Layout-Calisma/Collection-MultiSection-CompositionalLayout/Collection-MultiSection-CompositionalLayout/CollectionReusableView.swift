//
//  CollectionReusableView.swift
//  Collection-MultiSection-CompositionalLayout
//
//  Created by Berk Canpolat on 1.01.2025.
//

import UIKit

class CollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var cellTitleLbl: UILabel!
    
    func setup(_ item:String) {
        cellTitleLbl.text = item
    }
}
