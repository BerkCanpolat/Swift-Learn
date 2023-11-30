//
//  YemekTableCell.swift
//  DetaliTabelView
//
//  Created by Berk Canpolat on 22.11.2023.
//

import UIKit

protocol yemekProtocolMain{
    func yemekProtocolFunc(indexPath:IndexPath)
}

class YemekTableCell: UITableViewCell {
    
    
    
    @IBOutlet weak var resimView: UIImageView!
    @IBOutlet weak var yemekLabel: UILabel!
    @IBOutlet weak var fiyatLabel: UILabel!
    
    var ulasProtocol:yemekProtocolMain?
    var ulasIndex:IndexPath?
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func siparisButton(_ sender: Any) {
        ulasProtocol?.yemekProtocolFunc(indexPath: ulasIndex!)
    }
    

}
