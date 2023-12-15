//
//  ViewController.swift
//  WidgetsKullanimi
//
//  Created by Berk Canpolat on 15.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var mySegment: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func yapButton(_ sender: Any) {
        if let alinanVeri = textField.text {
            labelSonuc.text = alinanVeri
        }
    }
    
    
    @IBAction func resim1Button(_ sender: Any) {
        imageView.image = UIImage(named: "resim1")
    }
    
    @IBAction func resim2Button(_ sender: Any) {
        imageView.image = UIImage(named: "resim2")
    }
    
    @IBAction func gosterButton(_ sender: Any) {
        print("Switch durum: \(mySwitch.isOn)")
    }
    
    
    @IBAction func switchButton(_ sender: UISwitch) {
        
        if sender.isOn {
            print("Switch on")
        }else {
            print("Switch off")
        }
    }
    
    
    @IBAction func buttonSegment(_ sender: UISegmentedControl) {
        let secilenIndeks = sender.selectedSegmentIndex
        let secilenKategori = sender.titleForSegment(at: secilenIndeks)
        print("Seçilen indeks: \(secilenKategori!)")
    }
    
    
    
}

