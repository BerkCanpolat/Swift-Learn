//
//  ViewController.swift
//  FilmlerApp
//
//  Created by Berk Canpolat on 16.12.2023.
//

import UIKit

class Anasayfa: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var filmlerListe = [Filmler]()
    
    var viewModel = AnasayfaViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        _ = viewModel.filmlerListe.subscribe(onNext: { liste in
            self.filmlerListe = liste
            self.collectionView.reloadData()
        })
        
        let tasarim = UICollectionViewFlowLayout()
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        let ekranGenislik = UIScreen.main.bounds.width
        
        let itemGenislik = (ekranGenislik - 30) / 2
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*1.6)
        
        collectionView.collectionViewLayout = tasarim
        
    }


}




extension Anasayfa:UICollectionViewDelegate, UICollectionViewDataSource, HucreProtocol {
    
    func sepeteTiklandi(indexPath: IndexPath) {
        var film = filmlerListe[indexPath.row]
        print("\(film.ad!) Seçildi!")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListe.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var film = filmlerListe[indexPath.row]
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmlerHucre", for: indexPath) as! FilmlerHucre
        
        cell.imageView.image = UIImage(named: film.resim!)
        cell.labelFiyat.text = "\(film.fiyat!) ₺"
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        
        cell.hucreUlasProtocol = self
        cell.indexUlas = indexPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var film = filmlerListe[indexPath.row]
        
        performSegue(withIdentifier: "toDetay", sender: film)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let film = sender as? Filmler {
                let gidilecekVC = segue.destination as! DetaySayfa
                
                gidilecekVC.film = film
                
            }
        }
    }
    
}
