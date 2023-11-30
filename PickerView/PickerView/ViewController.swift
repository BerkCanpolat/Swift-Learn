//
//  ViewController.swift
//  PickerView
//
//  Created by Berk Canpolat on 21.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: - UIElements
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var ulkeLabel: UILabel!
    
    
    //MARK: - Propertys
    var ulkeler = [String]()
    var secilenUlke:String?
    

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        ulkeler = ["Türkiye","Almanya","Rusya","Fransa","Hollanda","Polonya"]
        
        
    }
    
    
    
    @IBAction func ulkeButton(_ sender: Any) {
        print(secilenUlke!)
    }
    


}


extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ulkeler.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ulkeler[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ulkeLabel.text = ulkeler[row]
        
        secilenUlke = ulkeler[row]
    }
    
}

