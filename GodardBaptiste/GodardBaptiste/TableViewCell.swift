//
//  TableViewCell.swift
//  GodardBaptiste
//
//  Created by Baptiste Godard on 31/01/2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var product_name: UILabel!
    @IBOutlet weak var product_price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
