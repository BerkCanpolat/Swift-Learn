//
//  PhotoReusableView.swift
//  CollectionView-FlowLayoutCalisma
//
//  Created by Berk Canpolat on 31.12.2024.
//

import UIKit

class PhotoReusableView: UICollectionReusableView {
    
    
    @IBOutlet weak var sectionHeaderTitle: UILabel!
    
    func displayHeaderSectionTitle(_ title:String) {
        self.sectionHeaderTitle.text = title
    }
    
}
