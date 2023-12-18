//
//  ViewController.swift
//  getirappOdev
//
//  Created by Berk Canpolat on 18.12.2023.
//

import UIKit

class Anasayfa: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: -VARIABLES
    var urunListem = [Urunler]()
    var urunArama = [String]()
    var aramaYapildiMi = false
    var viewModel = AnasayfaViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Getir"
        
        let app = UINavigationBarAppearance()
        
        app.backgroundColor = UIColor.purple
        
        app.titleTextAttributes = [.foregroundColor: UIColor.yellow, .font:UIFont(name: "Preahvihear-Regular", size: 22)!]
        
        navigationController?.navigationBar.standardAppearance = app
        navigationController?.navigationBar.scrollEdgeAppearance = app
        navigationController?.navigationBar.compactAppearance = app
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        _ = viewModel.urunlerim.subscribe(onNext: { liste in
            self.urunListem = liste
            self.collectionView.reloadData()
        })
        
        let tasarim = UICollectionViewFlowLayout()
        
        tasarim.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        tasarim.minimumInteritemSpacing = 0
        tasarim.minimumLineSpacing = 5
        
        let ekranGenislik = UIScreen.main.bounds.width
        
        let itemGenislik = (ekranGenislik - 12) / 3
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*1.1)
        
        collectionView.collectionViewLayout = tasarim
        
    }


}


//MARK: - Collectin View

extension Anasayfa:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if aramaYapildiMi {
            return urunArama.count
        }else {
            return urunListem.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let urun = urunListem[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "urunlerHucre", for: indexPath) as! urunlerHucre
        
        if aramaYapildiMi {
            let urunAd = urunArama[indexPath.row]
            if let urun = urunListem.first(where: { $0.urun_ad == urunAd }) {
                cell.urunlerLabel.text = urun.urun_ad
                cell.urunlerImageView.image = UIImage(named: urun.urun_resim!)
            }
        } else {
            cell.urunlerLabel.text = urun.urun_ad
            cell.urunlerImageView.image = UIImage(named: urun.urun_resim!)
        }
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3

        
        return cell
    }
}


//MARK: - Search Bar

extension Anasayfa:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            aramaYapildiMi = false
        } else {
            aramaYapildiMi = true
            urunArama = urunListem.filter({$0.urun_ad!.lowercased().contains(searchText.lowercased())})
                    .map({$0.urun_ad!})
        }
        
        collectionView.reloadData()
    }
}

