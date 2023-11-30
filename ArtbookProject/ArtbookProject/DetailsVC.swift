//
//  DetailsVC.swift
//  ArtbookProject
//
//  Created by Berk Canpolat on 24.11.2023.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let context = appDelegate.persistentContainer.viewContext

class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var ımageView: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var artistField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    
    var detailsHome = ""
    var detailsID:UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeyboard = UITapGestureRecognizer(target: self, action: #selector(self.hidKeybo))
        view.addGestureRecognizer(hideKeyboard)
        
        ımageView.isUserInteractionEnabled = true
        
        let ImageTap = UITapGestureRecognizer(target: self, action: #selector(self.imageSelect))
        view.addGestureRecognizer(ImageTap)
        
        
        if detailsHome != "" {
            
            
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            fetchRequest.returnsObjectsAsFaults = false
            
            let filtre = detailsID?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", filtre!)
            
            do {
                let results = try context.fetch(fetchRequest)
                
                for i in results as! [NSManagedObject] {
                   if let name = i.value(forKey: "name") as? String {
                        nameField.text = name
                    }
                    
                    if let artist = i.value(forKey: "artist") as? String {
                        artistField.text = artist
                    }
                    
                    if let year = i.value(forKey: "year") as? Int {
                        yearField.text = String(year)
                    }
                    
                    if let image = i.value(forKey: "image") as? Data {
                        let newimg = UIImage(data: image)
                        ımageView.image = newimg
                    }
                    
                    
                }
                
            } catch {
                print("Detay Gösterirken Hata")
            }
            
        } else {
            print("")
        }
        
    }
    
    @objc func imageSelect() {
        let img = UIImagePickerController()
        img.delegate = self
        img.sourceType = .photoLibrary
        img.allowsEditing = true
        present(img, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        ımageView.image = info[.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
    @objc func hidKeybo() {
        view.endEditing(true)
    }
    

    @IBAction func kaydetButton(_ sender: Any) {
        
        let newData = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        newData.setValue(nameField.text!, forKey: "name")
        newData.setValue(artistField.text!, forKey: "artist")
        
        if let newYear = Int(yearField.text!) {
            newData.setValue(newYear, forKey: "year")
        }
        
        newData.setValue(UUID(), forKey: "id")
        
        let newImage = ımageView.image?.jpegData(compressionQuality: 0.5)
        
        newData.setValue(newImage, forKey: "image")
        
        do {
            try context.save()
        } catch {
            print("Yüklerken hata oluştu")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
