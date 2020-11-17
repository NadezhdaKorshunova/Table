//
//  TableViewCell.swift
//  Table
//
//  Created by user on 15/11/2020.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLable: UILabel!

    @IBOutlet weak var ptofileImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
