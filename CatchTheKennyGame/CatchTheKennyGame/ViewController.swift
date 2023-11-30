//
//  ViewController.swift
//  CatchTheKennyGame
//
//  Created by Berk Canpolat on 23.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var girisAd = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func girisButton(_ sender: Any) {
        girisAd = nameField.text!
        
        performSegue(withIdentifier: "sayfaGecis", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sayfaGecis" {
            let segueGecis = segue.destination as! KennyPageVC
            segueGecis.homeName = girisAd
        }
    }
    
}

