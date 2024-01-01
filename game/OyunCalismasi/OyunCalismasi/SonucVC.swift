//
//  SonucVC.swift
//  OyunCalismasi
//
//  Created by Berk Canpolat on 1.01.2024.
//

import UIKit

class SonucVC: UIViewController {
    
    
    @IBOutlet weak var anlikSkoreLabel: UILabel!
    @IBOutlet weak var yuksekSkoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    @IBAction func tekrarOynaButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
