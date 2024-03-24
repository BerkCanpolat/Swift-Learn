//
//  ViewController.swift
//  NasaApiNetworkLearn
//
//  Created by Berk Canpolat on 24.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nasaTitle: UILabel!
    @IBOutlet weak var nasaExplanation: UITextView!
    @IBOutlet weak var nasaDate: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        var request = URLRequest(url: URL(string: "https://api.nasa.gov/planetary/apod?api_key=fR5fHV33cOlbqpev7dlMQg2PchFtvJggi2NOZfNE")!)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                return
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:Any] {
                    let title = json["title"] as? String ?? "BOŞ"
                    let date = json["date"] as? String ?? "BOŞ"
                    let explanation = json["explanation"] as? String ?? "BOŞ"
                    let hdurl = json["url"] as? String ?? "BOŞ"
                    
                    DispatchQueue.main.async {
                        self.nasaTitle.text = title
                        self.nasaExplanation.text = explanation
                        self.nasaDate.text = date
                        
                        do {
                            self.imageView.image = UIImage(data: try Data(contentsOf: URL(string: hdurl)!))
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            
            
        }.resume()
    }


}

