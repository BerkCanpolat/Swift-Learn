//
//  HeaderVieww.swift
//  E-Commerce-CompositionalLayout
//
//  Created by Berk Canpolat on 2.01.2025.
//

import UIKit

class HeaderVieww: UICollectionReusableView {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
}
