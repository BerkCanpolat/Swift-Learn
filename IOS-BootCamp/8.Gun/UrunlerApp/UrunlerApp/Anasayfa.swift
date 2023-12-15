//
//  ViewController.swift
//  UrunlerApp
//
//  Created by Berk Canpolat on 15.12.2023.
//

import UIKit

class Anasayfa: UIViewController {
    
    var urunListesi = [Urunler]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let u1 = Urunler(id: 1, ad: "Macbook Pro 14", resim: "bilgisayar", fiyat: 43000)
        let u2 = Urunler(id: 2, ad: "Rayban Club Master", resim: "gozluk", fiyat: 2500)
        let u3 = Urunler(id: 3, ad: "Sony ZX Series", resim: "kulaklik", fiyat: 40000)
        let u4 = Urunler(id: 4, ad: "Gio Armani", resim: "parfum", fiyat: 2000)
        let u5 = Urunler(id: 5, ad: "Casio X Series", resim: "saat", fiyat: 8000)
        let u6 = Urunler(id: 6, ad: "Dyson V8", resim: "supurge", fiyat: 18000)
        let u7 = Urunler(id: 7, ad: "Iphone 13", resim: "telefon", fiyat: 32000)
        
        urunListesi.append(u1)
        urunListesi.append(u2)
        urunListesi.append(u3)
        urunListesi.append(u4)
        urunListesi.append(u5)
        urunListesi.append(u6)
        urunListesi.append(u7)
        
        tableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        
    }


}

extension Anasayfa: UITableViewDelegate, UITableViewDataSource, HucreProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let urun = urunListesi[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre", for: indexPath) as! UrunlerHucre
        
        cell.imageViewUrun.image = UIImage(named: urun.resim!)
        cell.labelUrunAd.text = urun.ad
        cell.labelUrunFiyat.text = "\(urun.fiyat!) ₺"
        
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.hucreArkaPlan.layer.cornerRadius = 10.0
        
        cell.protocolUlas = self
        cell.indexUlas = indexPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let urun = urunListesi[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contextualAction,view,bool in
            print("\(urun.ad!) Silindi")
        }
        
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle") { contextualAction,view,bool in
            print("\(urun.ad!) Düzenlendi")
        }
        
        return UISwipeActionsConfiguration(actions: [silAction,duzenleAction])
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urun = urunListesi[indexPath.row]
        
        performSegue(withIdentifier: "toDetay", sender: urun)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let urun = sender as? Urunler {
                let gidilecekVC = segue.destination as! DetaySayfa
                
                gidilecekVC.urun = urun
            }
        }
    }
    
    func sepeteEkleTiklandi(indexPath: IndexPath) {
        let urun = urunListesi[indexPath.row]
        print("\(urun.ad!) Sepete eklendi")
    }
}
