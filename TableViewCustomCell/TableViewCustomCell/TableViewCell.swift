//
//  TableViewCell.swift
//  TableViewCustomCell
//
//  Created by Berk Canpolat on 22.11.2023.
//

import UIKit

protocol cellProtocol {
    func benimProtocol(indexPath: IndexPath)
}

class TableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var cellLabel: UILabel!
    
    
    var ulasProtocol:cellProtocol?
    var ulasIndex:IndexPath?
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func cellButton(_ sender: Any) {
        ulasProtocol?.benimProtocol(indexPath: ulasIndex!)
    }
    

}
