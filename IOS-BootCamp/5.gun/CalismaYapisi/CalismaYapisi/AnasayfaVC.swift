//
//  ViewController.swift
//  CalismaYapisi
//
//  Created by Berk Canpolat on 14.12.2023.
//

import UIKit

class AnasayfaVC: UIViewController {
    
    
    @IBOutlet weak var labelAnasayfa: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonYap(_ sender: Any) {
        labelAnasayfa.text = "Değiştirildi"
    }
    
    
    @IBAction func buttonBasla(_ sender: Any) {
        performSegue(withIdentifier: "oyunEkraninaGecis", sender: nil)
    }
    

}

