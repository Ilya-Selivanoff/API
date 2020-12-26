//
//  StarWarViewCell.swift
//  API
//
//  Created by Илья Селиванов  on 26.12.2020.
//

import UIKit

class StarWarViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    // Set the identifier for the custom cell
    static let cellId = "swarWarCellId"
    
    // Returning the xib file after instantiating it
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
