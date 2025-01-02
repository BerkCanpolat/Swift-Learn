//
//  ViewController.swift
//  E-Commerce-CompositionalLayout
//
//  Created by Berk Canpolat on 2.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionVie: UICollectionView! {
        didSet {
            collectionVie.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionVie.collectionViewLayout = layout
        
        collectionVie.register(UINib(nibName: "HeaderVieww", bundle: nil), forSupplementaryViewOfKind: "header", withReuseIdentifier: "HeaderVieww")
        
    }
    
    let layout: UICollectionViewCompositionalLayout = {
        
        /// ITEM
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        
        /// GROUP
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        
        /// SECTION
        let section = NSCollectionLayoutSection(group: group)
        
        
        /// SUPLEMENTARY
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        return UICollectionViewCompositionalLayout(section: section)
        
    }()


}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 2 ? 15 : 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .brown
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: "HeaderVieww", for: indexPath) as? HeaderVieww else {
            return UICollectionReusableView()
        }
        
        view.title = indexPath.section == 1 ? "Recently Viewed" : "Browse by category"
        
        return view
    }
    
}
