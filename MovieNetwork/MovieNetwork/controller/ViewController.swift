//
//  ViewController.swift
//  MovieNetwork
//
//  Created by Berk Canpolat on 27.12.2023.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var filmCV: UICollectionView!
    @IBOutlet weak var actorCollection: UICollectionView!
    
    var filmModel : [FilmModel] = []
    var oyuncuModel: [OyuncuModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmCV.delegate = self
        filmCV.dataSource = self
        
        actorCollection.delegate = self
        actorCollection.dataSource = self
        
        getM()
        getA()
        
    }
    
    func getM() {
        let url = URL(string: "https://dummyapi.online/api/movies")
        WebService.shared.getMovie(url: url!) { film in
            if let m = film {
                DispatchQueue.main.async {
                    self.filmModel = m
                    self.filmCV.reloadData()
                }

            }
        }
    }
    
    func getA() {
        let url = URL(string: "https://dummyapi.online/api/users")
        WebService.shared.getActor(url: url!) { oyuncu in
            if let o = oyuncu {
                DispatchQueue.main.async {
                    self.oyuncuModel = o
                    self.actorCollection.reloadData()
                }
            }
        }
    
    }


}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == filmCV {
            return filmModel.count
        } else {
            return oyuncuModel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == filmCV {
            let cell = filmCV.dequeueReusableCell(withReuseIdentifier: "filmCell", for: indexPath) as! FilmCell
            
            let item = filmModel[indexPath.row]
            
            cell.setup(filmModel[indexPath.row])
            
            /*cell.filmTitle.text = item.movie
            cell.filmRating.text = "\(item.rating!)"*/
            
            return cell
        } else {
            let cell = actorCollection.dequeueReusableCell(withReuseIdentifier: "oyuncuCell", for: indexPath) as! OyuncuCell
            
            let item = oyuncuModel[indexPath.row]
            
            cell.actorLabel.text = item.name
            
            return cell
        }
    }
    
}
