//
//  UrunlerHucre.swift
//  UrunlerApp
//
//  Created by Berk Canpolat on 15.12.2023.
//

import UIKit

class UrunlerHucre: UITableViewCell {
    
    
    @IBOutlet weak var hucreArkaPlan: UIView!
    @IBOutlet weak var imageViewUrun: UIImageView!
    @IBOutlet weak var labelUrunAd: UILabel!
    @IBOutlet weak var labelUrunFiyat: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
    }
    

}
