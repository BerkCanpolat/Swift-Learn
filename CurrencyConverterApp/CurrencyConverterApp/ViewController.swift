//
//  ViewController.swift
//  CurrencyConverterApp
//
//  Created by Berk Canpolat on 22.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func getRatesButton(_ sender: Any) {
        
        // 1) Request & Session -> İstek yollamak.
        // 2) Response & Data -> Bu İsteği Almak.
        // 3) Parsing & JSON Serialization -> Gelen Veriyi İşlemek.
        // HTTP izinleri almak için info.plist -> App Transport Security Settings -> Allows Arbitrary Loads -> YES
        
        
        // 1.
        //Url'yi tanımlamak
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=52ef584ae3b28f7c5263cc2139223af0")
        
        //İstediğimiz ağa gidip ordan veri alışverişi yapmak için bunu kullanmamız lazım.
        let session =  URLSession.shared
        
        //Closure
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                
                // 2.
                //Veriyi - İsteği almak.
                
                if data != nil {
                    
                    //JSON result objesi oluşturucaz. Çünkü Veriyi Json Formatında Alıcaz.
                    
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        //ASYNC
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String:Any] {
                                
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF: \(chf)"
                                }
                                
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                }
                                
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY: \(jpy)"
                                }
                                
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                
                                if let turkish = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY: \(turkish)"
                                }
                                
                            }
                            
                        }
                        
                    } catch {
                        
                    }
                    
                }
                
            }
        }
        
        task.resume() //Başlatma - Devam ettirme. Bu olmazsa isteğimiz başlamıyor.
        
    }
    

}

