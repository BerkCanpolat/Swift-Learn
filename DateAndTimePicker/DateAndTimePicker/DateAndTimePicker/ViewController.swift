//
//  ViewController.swift
//  DateAndTimePicker
//
//  Created by Berk Canpolat on 21.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UIElements
    
    
    @IBOutlet weak var saatField: UITextField!
    @IBOutlet weak var tarihField: UITextField!
    
    
    var datePicker: UIDatePicker?
    var timePicker: UIDatePicker?
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
         datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        
        tarihField.inputView = datePicker
        
        datePicker?.addTarget(self, action: #selector(dateView(tarih: )), for: UIControl.Event.valueChanged)
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        
        saatField.inputView = timePicker
        
        timePicker?.addTarget(self, action: #selector(timeView(saat: )), for: UIControl.Event.valueChanged)
        
        let zamanKapat = UITapGestureRecognizer(target: self, action: #selector(self.kapat))
        view.addGestureRecognizer(zamanKapat)
        
    }
    
    
    
    
    
    //MARK: - Helpers
    
    @objc func dateView(tarih: UIDatePicker) {
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy"
        let alinanTarih = dateFormat.string(from: datePicker!.date)
        
        tarihField.text = alinanTarih
        
    }
    
    @objc func timeView(saat: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh/mm"
        let alinanSaat = dateFormatter.string(from: timePicker!.date)
        
        saatField.text = alinanSaat
        
    }
    
    @objc func kapat() {
        view.endEditing(true)
    }
    


}

