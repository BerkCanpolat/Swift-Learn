//
//  ViewController.swift
//  DetaliTabelView
//
//  Created by Berk Canpolat on 22.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UIElements
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Propertys
    var yemekListem = [Yemekler]()
    var detayMain:Yemekler?

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let y1 = Yemekler(yemekID: 1, yemekAdi: "Ayran", yemekResim: "ayran", yemekFiyat: 12.99)
        let y2 = Yemekler(yemekID: 2, yemekAdi: "Baklava", yemekResim: "baklava", yemekFiyat: 32.99)
        let y3 = Yemekler(yemekID: 3, yemekAdi: "Fanta", yemekResim: "fanta", yemekFiyat: 33.21)
        let y4 = Yemekler(yemekID: 4, yemekAdi: "Izgara Somon", yemekResim: "izgarasomon", yemekFiyat: 14.55)
        let y5 = Yemekler(yemekID: 5, yemekAdi: "Izgara Tavuk", yemekResim: "izgaratavuk", yemekFiyat: 9.99)
        let y6 = Yemekler(yemekID: 6, yemekAdi: "Kadayıf", yemekResim: "kadayif", yemekFiyat: 4.99)
        let y7 = Yemekler(yemekID: 7, yemekAdi: "Kahve", yemekResim: "kahve", yemekFiyat: 3.22)
        let y8 = Yemekler(yemekID: 8, yemekAdi: "Köfte", yemekResim: "kofte", yemekFiyat: 44.21)
        let y9 = Yemekler(yemekID: 9, yemekAdi: "Lazanya", yemekResim: "lazanya", yemekFiyat: 10.55)
        let y10 = Yemekler(yemekID: 10, yemekAdi: "Makarna", yemekResim: "makarna", yemekFiyat: 1.99)
        let y11 = Yemekler(yemekID: 11, yemekAdi: "Pizza", yemekResim: "pizza", yemekFiyat: 21.21)
        let y12 = Yemekler(yemekID: 12, yemekAdi: "Su", yemekResim: "su", yemekFiyat: 1.21)
        let y13 = Yemekler(yemekID: 13, yemekAdi: "Sütlaç", yemekResim: "sutlac", yemekFiyat: 4.33)
        let y14 = Yemekler(yemekID: 14, yemekAdi: "Tiramisu", yemekResim: "tiramisu", yemekFiyat: 12.12)
        
        yemekListem.append(y1)
        yemekListem.append(y2)
        yemekListem.append(y3)
        yemekListem.append(y4)
        yemekListem.append(y5)
        yemekListem.append(y6)
        yemekListem.append(y7)
        yemekListem.append(y8)
        yemekListem.append(y9)
        yemekListem.append(y10)
        yemekListem.append(y11)
        yemekListem.append(y12)
        yemekListem.append(y13)
        yemekListem.append(y14)
        
    }
    

}


//MARK: - TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource,yemekProtocolMain {
    
    func yemekProtocolFunc(indexPath: IndexPath) {
//        let alert = UIAlertController(title: "UYARI", message: "\(yemekListem[indexPath.row].yemekAdi!) siparişiniz alınmıştır!", preferredStyle: UIAlertController.Style.alert)
//        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
//        let cancelButton = UIAlertAction(title: "İptal", style: UIAlertAction.Style.destructive)
//        alert.addAction(okButton)
//        alert.addAction(cancelButton)
//        present(alert, animated: true, completion: nil)
        
        detayMain = yemekListem[indexPath.row]
        
        performSegue(withIdentifier: "yemekID", sender: nil)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemekListem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let indeks = yemekListem[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! YemekTableCell
        
        cell.yemekLabel.text = "\(indeks.yemekAdi!)"
        cell.fiyatLabel.text = "\(indeks.yemekFiyat!) TL"
        cell.resimView.image = UIImage(named: indeks.yemekResim!)
        
        cell.ulasProtocol = self
        cell.ulasIndex = indexPath
        
        return cell
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "yemekID" {
            let detayGecis = segue.destination as! DetailsPageVC
            
            detayGecis.detailsPage = detayMain
            
        }
    }
    
    
}

