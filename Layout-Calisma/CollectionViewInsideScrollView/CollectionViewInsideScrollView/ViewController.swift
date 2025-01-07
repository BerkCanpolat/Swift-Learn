//
//  ViewController.swift
//  CollectionViewInsideScrollView
//
//  Created by Berk Canpolat on 7.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var collection_view_1: UICollectionView!
    
    @IBOutlet weak var collection_view_2: UICollectionView!
    
    
    @IBOutlet weak var collection_view_1_height: NSLayoutConstraint!
    
    
    @IBOutlet weak var collection_view_2_height: NSLayoutConstraint!
    
    var colorArr:[UIColor] = [.red,.blue,.gray,.green,.black,.brown,.cyan]

    override func viewDidLoad() {
        super.viewDidLoad()
        collection_view_1.register(UINib(nibName: "ItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemsCollectionViewCell")
        collection_view_2.register(UINib(nibName: "ItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemsCollectionViewCell")
        self.view.layoutIfNeeded()
    }
    
    override func viewDidLayoutSubviews() {
        self.changeCollectionHeight()
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemsCollectionViewCell", for: indexPath) as! ItemsCollectionViewCell
        cell.container_view.backgroundColor = colorArr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width-4)/2, height: 160)
    }
    
    func changeCollectionHeight() {
        self.collection_view_1_height.constant = self.collection_view_1.contentSize.height
        self.collection_view_2_height.constant = self.collection_view_2.contentSize.height
    }
}
