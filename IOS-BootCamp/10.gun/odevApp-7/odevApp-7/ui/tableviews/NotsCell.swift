//
//  NotsCell.swift
//  odevApp-7
//
//  Created by Berk Canpolat on 20.12.2023.
//

import UIKit

class NotsCell: UITableViewCell {
    
    
    @IBOutlet weak var notsHeadLabel: UILabel!
    @IBOutlet weak var notsContentLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
