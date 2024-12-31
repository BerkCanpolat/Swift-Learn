//
//  TableViewCell.swift
//  OOPCollectionAndTableView
//
//  Created by Berk Canpolat on 26.05.2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [Movies] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollection()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    public func configure(with movies: [Movies]) {
        self.movies = movies
        collectionView.reloadData()
    }

    

}

extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let movie = movies[indexPath.item]
        cell.imageView.image = UIImage(named: movie.image)
        return cell
    }
}
