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
    
    var viewModel = AnasayfaViewModel()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = viewModel.sonuc.subscribe(onNext: { s in//Dinleme
            self.labelSonuc.text = s
        })
        
    }

    @IBAction func toplama(_ sender: Any) {
        if let alinanSayi1 = textFieldSayi1.text, let alinanSayi2 = textFieldSayi2.text {
            viewModel.toplamaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
        }
    }
    
    
    @IBAction func carpma(_ sender: Any) {
        if let alinanSayi1 = textFieldSayi1.text, let alinanSayi2 = textFieldSayi2.text {
            viewModel.carmpaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
        }
    }
    
    
}

