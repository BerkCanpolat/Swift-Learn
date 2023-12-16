//
//  ViewController.swift
//  MVVMKullanimi
//
//  Created by Berk Canpolat on 16.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var textFieldSayi1: UITextField!
    @IBOutlet weak var textFieldSayi2: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        labelSonuc.text = "0"
    }

    @IBAction func toplama(_ sender: Any) {
        if let alinanSayi1 = textFieldSayi1.text, let alinanSayi2 = textFieldSayi2.text {
            if let sayi1 = Int(alinanSayi1), let sayi2 = Int(alinanSayi2) {
                let toplam = sayi1 + sayi2
                labelSonuc.text = String(toplam)
            }
        }
    }
    
    
    @IBAction func carpma(_ sender: Any) {
        if let alinanSayi1 = textFieldSayi1.text, let alinanSayi2 = textFieldSayi2.text {
            if let sayi1 = Int(alinanSayi1), let sayi2 = Int(alinanSayi2) {
                let carpma = sayi1 * sayi2
                labelSonuc.text = String(carpma)
            }
        }
    }
    
    
}

