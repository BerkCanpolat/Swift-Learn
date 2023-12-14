//
//  OyunEkraniVC.swift
//  CalismaYapisi
//
//  Created by Berk Canpolat on 14.12.2023.
//

import UIKit

class OyunEkraniVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonGeri(_ sender: Any) {
        //navigationController?.popViewController(animated: true)
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func buttonBitir(_ sender: Any) {
        performSegue(withIdentifier: "sonucEkraninaGecis", sender: nil)
    }
    

}
