//
//  TahminPageVC.swift
//  Sayi Tahmin
//
//  Created by Berk Canpolat on 23.11.2023.
//

import UIKit

class TahminPageVC: UIViewController {
    
    //MARK: - UIElements
    @IBOutlet weak var kalanhakLabel: UILabel!
    @IBOutlet weak var arttirLabel: UILabel!
    @IBOutlet weak var tahminField: UITextField!
    @IBOutlet weak var hileLabel: UILabel!
    
    
    //MARK: - Propertys
    var kalanHak = 5
    var random: Int?
    
    
    

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        random = Int(arc4random_uniform(UInt32(100)))
        
        print(random!)
        
        arttirLabel.isHidden = true
        hileLabel.isHidden = true

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gidenVeri = sender as? Bool {
            let gecisSegue = segue.destination as! SonucPageVC
            gecisSegue.sonuc = gidenVeri
        }
    }
    
    
    @IBAction func tahminetButton(_ sender: Any) {
        arttirLabel.isHidden = false
        kalanHak -= 1
        
        if let tahminAlani = tahminField.text {
            
            if let veri = Int(tahminAlani) {
                
                if kalanHak != 0 {
                    
                    //sayfa Geçişi
                    if veri == random! {
                        
                        let tahminSonuc = true
                        performSegue(withIdentifier: "sonucGecis", sender: tahminSonuc)
                        return
                        
                    }
                    
                    if veri < random! {
                        arttirLabel.text = "Arttır"
                        kalanhakLabel.text = "Kalan Hak: \(kalanHak)"
                    }
                    
                    if veri > random! {
                        arttirLabel.text = "Azalt"
                        kalanhakLabel.text = "Kalan Hak: \(kalanHak)"
                    }
                    
                }
                
                //sayfa geçişi
                if kalanHak == 0 {
                    let tahminSonuc = false
                    performSegue(withIdentifier: "sonucGecis", sender: tahminSonuc)
                    return
                    
                }
                
                tahminField.text = ""
                
            }
            
        }
        
    } //Fonksiyon
    
    
    
    @IBAction func hileButton(_ sender: Any) {
        hileLabel.text = "Hile Sonuç: \(random!)"
        hileLabel.isHidden = false
    }
    
}
