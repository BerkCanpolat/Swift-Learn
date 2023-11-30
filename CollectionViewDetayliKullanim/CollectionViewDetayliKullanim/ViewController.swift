//
//  ViewController.swift
//  CollectionViewDetayliKullanim
//
//  Created by Berk Canpolat on 22.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UIElements
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //MARK: - Propertys
    var filmListem = [Filmler]()
    var detayMain: Filmler?
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let f1 = Filmler(filmAdi: "Bir Zamanlar Anadoluda", filmYil: 1999, filmFiyati: 12.99, filmResim: "birzamanlaranadoluda")
        let f2 = Filmler(filmAdi: "Django", filmYil: 2013, filmFiyati: 12.99, filmResim: "django")
        let f3 = Filmler(filmAdi: "Inception", filmYil: 2020, filmFiyati: 1.99, filmResim: "inception")
        let f4 = Filmler(filmAdi: "Interstellar", filmYil: 2011, filmFiyati: 33.12, filmResim: "interstellar")
        let f5 = Filmler(filmAdi: "The HatefulEight", filmYil: 1978, filmFiyati: 3.99, filmResim: "thehatefuleight")
        let f6 = Filmler(filmAdi: "The Pianist", filmYil: 2008, filmFiyati: 5.99, filmResim: "thepianist")
        
        filmListem.append(f1)
        filmListem.append(f2)
        filmListem.append(f3)
        filmListem.append(f4)
        filmListem.append(f5)
        filmListem.append(f6)
        
    }


}


    //MARK: - Collectin View
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, filmlerMainProtocol {
    
    func filmlerFuncProtocol(indexPath: IndexPath) {
        print("\(filmListem[indexPath.row].filmAdi!) Sepete eklenmiştir!")
        
        detayMain = filmListem[indexPath.row]
        
        performSegue(withIdentifier: "filmGecis", sender: nil)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmListem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let indeks = filmListem[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmID", for: indexPath) as! FilmCollectionCell
        
        cell.filmIsim.text = indeks.filmAdi
        cell.filmFiyat.text = "\(indeks.filmFiyati!)"
        cell.filmResim.image = UIImage(named: indeks.filmResim!)
        
        cell.ulasProtocol = self
        cell.ulasIndex = indexPath
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "filmGecis" {
            
            let segueDetay = segue.destination as! DetailsPageVC
            
            segueDetay.detailsPage = detayMain
            
        }
    }
    
    
}
