//
//  TableViewCell.swift
//  CollectioninTableView
//
//  Created by Berk Canpolat on 22.05.2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var list : [Product] = [Product]()
    
    func configure(items : [Product]) {
        list = items
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}


extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = .systemGray6
        return cell
    }
}
